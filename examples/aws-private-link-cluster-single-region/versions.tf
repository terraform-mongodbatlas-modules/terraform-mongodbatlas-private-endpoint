terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0"
    }
  }
  required_version = "~> 1.0"
}
