data "aws_region" "current" {}

module "private_link" {
  source = "../private-link"

  project_id          = var.project_id
  region              = data.aws_region.current.name
  endpoint_service_id = aws_vpc_endpoint.aws_endpoint.id
}

resource "aws_vpc_endpoint" "aws_endpoint" {
  vpc_id             = var.vpc_id
  service_name       = module.private_link.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}
