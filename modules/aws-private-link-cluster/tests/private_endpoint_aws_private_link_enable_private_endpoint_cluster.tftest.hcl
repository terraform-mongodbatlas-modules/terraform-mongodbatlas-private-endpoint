provider "mongodbatlas" {
}

provider "aws" {
  region = "us-east-1"
}

run "generate_random_name" {
  module {
    source = "./tests/random_name_generator"
  }
}

run "create_project" {
  module {
    source = "./tests/project_generator"
  }

  variables {
    project_name = "test-modules-tf-p-${run.generate_random_name.name_project}"
  }
}

run "create_vpc" {
  module {
    source = "./tests/vpc_generator"
  }
}

run "enable_private_endpoint_cluster" {
  command = apply

  module {
    source = "./"
  }

  variables {
    project_id         = run.create_project.project_id
    vpc_id             = run.create_vpc.vpc_id
    subnet_ids         = [run.create_vpc.subnet]
    security_group_ids = [run.create_vpc.sg]
  }

  assert {
    condition     = aws_vpc_endpoint.aws_endpoint.vpc_endpoint_type == "Interface"
    error_message = "Invalid vpc endpoint type"
  }

  assert {
    condition     = aws_vpc_endpoint.aws_endpoint.vpc_id == run.create_vpc.vpc_id
    error_message = "Invalid vpc endpoint id"
  }

  assert {
    condition     = mongodbatlas_privatelink_endpoint.mongodb_endpoint.provider_name == "AWS"
    error_message = "Invalid provider name"
  }

  assert {
    condition     = mongodbatlas_privatelink_endpoint.mongodb_endpoint.project_id == run.create_project.project_id
    error_message = "Invalid project id"
  }

  assert {
    condition     = mongodbatlas_privatelink_endpoint_service.private_endpoint.private_link_id == mongodbatlas_privatelink_endpoint.mongodb_endpoint.private_link_id
    error_message = "Invalid private link id: does not coincide with the private link id generated from the mongodbatlas_privatelink_endpoint resource"
  }
}
