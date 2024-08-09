terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0" # in older versions security_group_ids is required
    }
  }
  required_version = "~> 1.0"
}
