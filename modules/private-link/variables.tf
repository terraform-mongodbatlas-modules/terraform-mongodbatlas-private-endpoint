variable "project_id" {
  description = "The project id (e.g., 65def6ce0f722a1507105bb5)."
  type        = string
}

variable "region" {
  description = "The AWS region where the private endpoint will be created."
  type        = string
}

variable "endpoint_service_id" {
  description = "The ID of the VPC endpoint service from AWS."
  type        = string
}
