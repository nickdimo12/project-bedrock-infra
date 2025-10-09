resource "aws_eks_cluster" "this" {
  name     = var.cluster_name
  role_arn = var.eks_role_arn
  version  = var.cluster_version
  compute_config {
    enabled = true
  }

  kubernetes_networking_config {
    elastic_load_balancing {
      enabled = true
    }
  }

  storage_config {
    block_storage {
      enabled = true
    }
  }

  vpc_config {
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "bedrock-eks"
  node_role_arn   = var.node_role_arn

  scaling_config {
    desired_size = 2
    max_size     = 3
    min_size     = 1
  }

  subnet_ids = var.subnet_ids
}

