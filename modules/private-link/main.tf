resource "mongodbatlas_privatelink_endpoint" "mongodb_endpoint" {
  project_id    = var.project_id
  provider_name = "AWS"
  region        = var.region
}

resource "mongodbatlas_privatelink_endpoint_service" "private_endpoint" {
  project_id          = mongodbatlas_privatelink_endpoint.mongodb_endpoint.project_id
  private_link_id     = mongodbatlas_privatelink_endpoint.mongodb_endpoint.private_link_id
  endpoint_service_id = var.endpoint_service_id
  provider_name       = "AWS"
}
