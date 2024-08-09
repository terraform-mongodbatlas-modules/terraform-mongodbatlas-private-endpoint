terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0" # in older versions security_group_ids is required
    }
  }
  required_version = "~> 1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_subnet" "subnet" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_security_group" "sg" {
  name_prefix = "default-"
  description = "Default security group for all instances in vpc"
  vpc_id      = aws_vpc.vpc.id
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet" {
  value = aws_subnet.subnet.id
}

output "sg" {
  value = aws_security_group.sg.id
}
