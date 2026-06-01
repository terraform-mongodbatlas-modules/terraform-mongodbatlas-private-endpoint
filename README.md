# Private Endpoint Terraform Module

> **Archived:** This repository is no longer maintained. Use the [MongoDB Atlas AWS module](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-atlas-aws) from the [terraform-mongodbatlas-modules](https://github.com/terraform-mongodbatlas-modules/) organization instead. For up-to-date Terraform examples and reference implementations, see [atlas-examples](https://github.com/terraform-mongodbatlas-modules/atlas-examples).

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
This Terraform module sets up a [private connection](https://www.mongodb.com/docs/atlas/security-private-endpoint/#-optional--regionalized-private-endpoints-for-multi-region-sharded-clusters) to a [MongoDB Atlas Database](https://www.mongodb.com/products/platform/atlas-database) and consists of an [aws private link cluster](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/modules/aws-private-link-cluster).

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [terraform-provider-mongodbatlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)
- [terraform-provider-aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) >= 4.6.0
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database) account
- [AWS](https://aws.amazon.com/account/) account
