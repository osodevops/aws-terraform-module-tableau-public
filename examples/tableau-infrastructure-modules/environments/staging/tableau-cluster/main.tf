module "tableau_server" {
  source = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/tableau-cluster"
  alb_allowed_ips         = var.alb_allowed_ips
  instance_allowed_ips    = var.instance_allowed_ips
  common_tags             = var.common_tags
  environment             = var.environment
  ssh_key_name            = var.ssh_key_name
  alb_certificate_arn     = var.alb_certificate_arn
  alb_deletion_protection = var.alb_deletion_protection
  instance_type           = var.instance_type
  force_destroy           = var.force_destroy
  root_disk_size          = var.root_disk_size
  data_volume_size        = var.data_volume_size
  vpc_name                = var.vpc_name
  alb_internal            = var.alb_internal
  aws_region              = var.aws_region
  account_alias           = var.account_alias
  dns_zone                = var.dns_zone
  is_private_zone         = var.is_private_zone
  asg_desired_capacity    = var.asg_desired_capacity
  asg_max_size            = var.asg_max_size
  enable_lambdas          = var.enable_lambdas
  create_lambdas          = var.create_lambdas
  maximum_zookeeper_size  = var.maximum_zookeeper_size
  manage_zookeeper        = var.manage_zookeeper
  manage_new_nodes        = var.manage_new_nodes
  manage_terminations     = var.manage_terminations
  manage_replicas         = var.manage_replicas
}