resource "mongodbatlas_privatelink_endpoint" "mongodb_endpoint" {
  project_id    = var.project_id
  provider_name = "AWS"
  region        = var.region
}

resource "aws_vpc_endpoint" "aws_endpoint" {
  vpc_id             = var.vpc_id
  service_name       = mongodbatlas_privatelink_endpoint.mongodb_endpoint.endpoint_service_name
  vpc_endpoint_type  = "Interface"
  subnet_ids         = var.subnet_ids
  security_group_ids = var.security_group_ids
}

resource "mongodbatlas_privatelink_endpoint_service" "private_endpoint" {
  project_id          = mongodbatlas_privatelink_endpoint.mongodb_endpoint.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.mongodb_endpoint.private_link_id
  endpoint_service_id = aws_vpc_endpoint.aws_endpoint.id
  provider_name       = "AWS"
}
