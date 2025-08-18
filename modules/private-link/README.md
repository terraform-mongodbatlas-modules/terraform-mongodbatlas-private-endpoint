# MongoDB Atlas Private Link Module

This module creates the MongoDB Atlas-specific resources for private endpoints, which can be used with various cloud providers' private link solutions.

## Resources Created

- `mongodbatlas_privatelink_endpoint` - Creates the MongoDB Atlas side of the private link connection
- `mongodbatlas_privatelink_endpoint_service` - Connects the Atlas endpoint to the cloud provider's endpoint service

## Usage

```hcl
module "atlas_private_link" {
  source = "../private-link"
  
  project_id          = "your-atlas-project-id"
  region              = "us-east-1"
  endpoint_service_id = aws_vpc_endpoint.example.id
}
```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project_id | The Atlas project ID | `string` | n/a | yes |
| region | The AWS region where the private endpoint will be created | `string` | n/a | yes |
| endpoint_service_id | The ID of the VPC endpoint service from AWS | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| private_link_id | Unique identifier of the AWS PrivateLink connection |
| private_link_error_message | Error message pertaining to the AWS PrivateLink connection |
| endpoint_service_name | Name of the PrivateLink endpoint service in AWS |
| interface_endpoint_id | Unique identifier of the interface endpoint |
| private_endpoint_connection_name | Name of the connection for this private endpoint that Atlas generates |
| private_endpoint_resource_id | Unique identifier of the private endpoint |

## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 1.0 |
| mongodbatlas | latest |
