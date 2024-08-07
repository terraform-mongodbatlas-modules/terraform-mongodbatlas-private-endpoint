# mongodbatlas_privatelink_endpoint

output "private_link_id" {
  description = "Unique identifier of the AWS PrivateLink connection."
  value       = mongodbatlas_privatelink_endpoint.mongodb_endpoint.private_link_id
}

output "private_link_error_message" {
  description = "Error message pertaining to the AWS PrivateLink connection. Returns null if there are no errors."
  value       = mongodbatlas_privatelink_endpoint.mongodb_endpoint.error_message
}

# aws_vpc_endpoint

output "vpc_endpoint_id" {
  description = "The ID of the VPC endpoint from AWS."
  value       = aws_vpc_endpoint.aws_endpoint.id
}

output "vpc_endpoint_arn" {
  description = "The Amazon Resource Name (ARN) of the VPC endpoint from AWS."
  value       = aws_vpc_endpoint.aws_endpoint.arn
}

# mongodbatlas_privatelink_endpoint_service

output "interface_endpoint_id" {
  description = "Unique identifier of the interface endpoint."
  value       = mongodbatlas_privatelink_endpoint_service.private_endpoint.interface_endpoint_id
}

output "private_endpoint_connection_name" {
  description = "Name of the connection for this private endpoint that Atlas generates."
  value       = mongodbatlas_privatelink_endpoint_service.private_endpoint.private_endpoint_connection_name
}

output "private_endpoint_resource_id" {
  description = "Unique identifier of the private endpoint."
  value       = mongodbatlas_privatelink_endpoint_service.private_endpoint.private_endpoint_resource_id
}
