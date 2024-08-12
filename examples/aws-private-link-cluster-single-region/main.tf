module "aws-private-link-cluster" {
  source             = "../../modules/aws-private-link-cluster"
  project_id         = var.project_id
  vpc_id             = aws_vpc.vpc.id
  subnet_ids         = [aws_subnet.subnet.id]
  security_group_ids = [aws_security_group.sg.id]
}

resource "mongodbatlas_advanced_cluster" "cluster" {
  project_id     = var.project_id
  name           = "single-region-cluster"
  cluster_type   = "REPLICASET"
  backup_enabled = true

  replication_specs {
    region_configs {
      priority      = 7
      provider_name = "AWS"
      region_name   = "US_EAST_1"
      electable_specs {
        instance_size = "M10"
        node_count    = 3
      }
    }
  }
  depends_on = [module.aws-private-link-cluster]
}

resource "mongodbatlas_project_ip_access_list" "cidr" {
  project_id = var.project_id
  cidr_block = aws_vpc.vpc.cidr_block
  comment = "VPC CIDR Block"
}
