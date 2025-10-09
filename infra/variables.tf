variable "cluster_name" {}
variable "cluster_version" {}
variable "vpc_id" {}
variable "subnet_ids" { type = list(string) }
variable "eks_role_arn" {}
variable "node_role_arn" {}
