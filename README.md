# Private Endpoint Terraform Module

This Terraform module sets up a [private connection](https://www.mongodb.com/docs/atlas/security-private-endpoint/#-optional--regionalized-private-endpoints-for-multi-region-sharded-clusters) to a [MongoDB Atlas Database](https://www.mongodb.com/products/platform/atlas-database) and consists of an [aws private link cluster](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/modules/aws-private-link-cluster).

## Requirements

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- [terraform-provider-mongodbatlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs)
- [terraform-provider-aws](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) >= 4.6.0
- [MongoDB Atlas](https://www.mongodb.com/products/platform/atlas-database) account
- [AWS](https://aws.amazon.com/account/) account
