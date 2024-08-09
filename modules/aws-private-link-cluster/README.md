# AWS Private Link Cluster Terraform Submodule

This Terraform submodule set ups a [private connection](https://www.mongodb.com/docs/atlas/security-private-endpoint/#-optional--regionalized-private-endpoints-for-multi-region-sharded-clusters) to a [MongoDB Atlas Cluster](https://www.mongodb.com/resources/products/fundamentals/mongodb-cluster-setup) utilizing [Amazon Virtual Private Cloud (aws vpc)](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html). The cluster can be either single region or geosharded (multiple regions).

It creates the following resources:

- A MongoDB Atlas Private Link Endpoint.
- An AWS VPC Endpoint.
- A MongoDB Atlas Private Link Endpoint Service.

You can find detailed information of the submodule's input and output variables in the [Terraform Public Registry]()

## Usage 

```terraform
module "aws-private-link-cluster" {
  source  = "terraform-mongodbatlas-modules/private-endpoint/mongodbatlas//modules/aws-private-link-cluster"
  version = "1.0.0"
  project_id = "66a26b4c85718b1be4ff37cb"
  vpc_id = "vpc-7fc0a543"
  subnet_ids = ["subnet-de0406d2"]
  security_group_ids = ["sg-3f238186"]
}
```

The [examples](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/examples) folder contains detailed examples that show how to use this submodule.

- [aws-private-link-cluster-single-region](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/examples/aws-private-link-cluster-single-region) shows how you can use the aws private link submodule to setup regionalized private endpoints for a MongoDB Atlas Cluster utilizing Amazon Virtual Private Cloud (aws vpc).
- [aws-private-link-cluster-geosharded](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/examples/aws-private-link-cluster-geosharded) shows how you can use the aws private link submodule to setup regionalized private endpoints for a geosharded MongoDB Atlas Cluster utilizing Amazon Virtual Private Cloud (aws vpc).

## Resources

The module creates the following resources:

| Name | Type |
|------|------|
| [mongodbatlas_privatelink_endpoint](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint) | resource |
| [aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [mongodbatlas_privatelink_endpoint_service](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs/resources/privatelink_endpoint_service) | resource |

Refer to the [MongoDB Atlas](https://registry.terraform.io/providers/mongodb/mongodbatlas/latest/docs) and [AWS](https://registry.terraform.io/providers/hashicorp/aws/latest/docs) Terraform providers documentations if you want more information.

In the case of the geosharded cluster, you have to enable the regionalized mode for Private Link and in each module defined provide a different AWS provider with the corresponding region. This [example](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/tree/main/examples/aws-private-link-cluster-geosharded) shows how you can do it.


## License

See [LICENSE](https://github.com/terraform-mongodbatlas-modules/terraform-mongodbatlas-private-endpoint/blob/main/LICENSE) for full details.
