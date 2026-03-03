# private-endpoint-aws-private-link-cluster - enable private endpoint for a geosharded cluster

# This module has been deprecated

This repository is no longer maintained. Its functionality has been superseded by the [MongoDB Atlas AWS Module](https://registry.terraform.io/modules/terraform-mongodbatlas-modules/atlas-aws/mongodbatlas/latest) (`terraform-mongodbatlas-modules/atlas-aws/mongodbatlas`), which provides PrivateLink support along with additional AWS integrations including encryption at rest with AWS KMS, cloud provider access, and backup export to S3.

## Migration

Replace your module source:

```hcl
# Before
module "private_endpoint" {
  source  = "terraform-mongodbatlas-modules/private-endpoint/mongodbatlas"
  version = "1.0.0"
  # ...
}

# After
module "atlas_aws" {
  source  = "terraform-mongodbatlas-modules/atlas-aws/mongodbatlas"
  project_id = var.project_id

  privatelink_endpoints = [
    {
      region     = "us-east-1"
      subnet_ids = ["subnet-abc123"]
    }
  ]
}
```

For multi-region and BYOE (Bring Your Own Endpoint) patterns, see the [atlas-aws examples](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws/tree/main/examples).

## Links

- [atlas-aws on Terraform Registry](https://registry.terraform.io/modules/terraform-mongodbatlas-modules/atlas-aws/mongodbatlas/latest)
- [atlas-aws on GitHub](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws)

# Old Docs
_Note: you can see the full source code in the [github repository](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/examples/aws-private-link-cluster-geosharded)_

This example shows how you can use the aws private link submodule to setup regionalized private endpoints for a geosharded MongoDB Atlas Cluster utilizing Amazon Virtual Private Cloud (aws vpc).

## Usage

- Set the following variable: 

    - `project_id`: ID of the Atlas project

- Set the following environment variables:

    -  `export MONGODB_ATLAS_PUBLIC_KEY="<YOUR_PUBLIC_KEY>"`
    -  `export MONGODB_ATLAS_PRIVATE_KEY="<YOUR_PRIVATE_KEY>"`
    -  `export AWS_ACCESS_KEY_ID="<YOUR_ACCESS_KEY>"`
    -  `export AWS_SECRET_ACCESS_KEY="<YOUR_SECRET_KEY>"`

- Run the following command to initialize your project:

```bash
$ terraform init
```

- Run the following command to review the execution plan:

```bash
$ terraform plan
```

- Run the following command to deploy your infrastructure:

```bash
$ terraform apply
```

## Resources

The module creates the following resources:

| Name | Type |
|------|------|
| [mongodbatlas_privatelink_endpoint](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint) | resource |
| [aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [mongodbatlas_privatelink_endpoint_service](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint_service) | resource |
