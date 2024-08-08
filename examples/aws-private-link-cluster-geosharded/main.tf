resource "mongodbatlas_private_endpoint_regional_mode" "regional_mode" {
  project_id = var.project_id
  enabled    = true
}

module "aws-private-link-us-east-1" {
  source             = "../../modules/aws-private-link-cluster"
  project_id         = var.project_id
  vpc_id             = aws_vpc.vpc_east.id
  subnet_ids         = [aws_subnet.subnet_east.id]
  security_group_ids = [aws_security_group.sg_east.id]
}

module "aws-private-link-us-west-1" {
  source             = "../../modules/aws-private-link-cluster"
  project_id         = var.project_id
  vpc_id             = aws_vpc.vpc_west.id
  subnet_ids         = [aws_subnet.subnet_west.id]
  security_group_ids = [aws_security_group.sg_west.id]
  providers = {
    aws = aws.west
  }
}

resource "mongodbatlas_advanced_cluster" "geosharded" {
  project_id     = var.project_id
  name           = "geosharded-cluster"
  cluster_type   = "GEOSHARDED"
  backup_enabled = true

  replication_specs {
    zone_name  = "east zone"
    num_shards = 1
    region_configs {
      priority      = 7
      provider_name = "AWS"
      region_name   = "US_EAST_1"
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
      analytics_specs {
        instance_size = "M10"
        node_count    = 1
      }
    }
  }

  replication_specs {
    zone_name  = "west zone"
    num_shards = 1
    region_configs {
      priority      = 7
      provider_name = "AWS"
      region_name   = "US_WEST_1"
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
      analytics_specs {
        instance_size = "M10"
        node_count    = 1
      }
    }
  }

  depends_on = [module.aws-private-link-us-east-1, module.aws-private-link-us-west-1]
}
