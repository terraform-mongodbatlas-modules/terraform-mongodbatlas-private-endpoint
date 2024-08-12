resource "aws_vpc" "vpc_east" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "ig_east" {
  vpc_id = aws_vpc.vpc_east.id
}

resource "aws_route" "route_east" {
  route_table_id         = aws_vpc.vpc_east.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_east.id
}

resource "aws_subnet" "subnet_east" {
  vpc_id                  = aws_vpc.vpc_east.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"
}

resource "aws_security_group" "sg_east" {
  name_prefix = "default-"
  description = "Default security group for all instances in vpc"
  vpc_id      = aws_vpc.vpc_east.id
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = [
      aws_vpc.vpc.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_vpc" "vpc_west" {
  provider             = aws.west
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "ig_west" {
  vpc_id = aws_vpc.vpc_west.id
}

resource "aws_route" "route_west" {
  route_table_id         = aws_vpc.vpc_west.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.ig_west.id
}

resource "aws_subnet" "subnet_west" {
  provider                = aws.west
  vpc_id                  = aws_vpc.vpc_west.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-1a"
}

resource "aws_security_group" "sg_west" {
  provider    = aws.west
  name_prefix = "default-"
  description = "Default security group for all instances in vpc"
  vpc_id      = aws_vpc.vpc_west.id
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    cidr_blocks = [
      aws_vpc.vpc.cidr_block
    ]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
