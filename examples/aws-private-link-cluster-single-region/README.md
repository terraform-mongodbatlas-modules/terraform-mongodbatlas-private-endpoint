# private-endpoint-aws-private-link-cluster - enable private endpoint for a single region cluster

This example shows how you can use the aws private link submodule to setup a private connection to a MongoDB Atlas Cluster utilizing Amazon Virtual Private Cloud (aws vpc). 

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

