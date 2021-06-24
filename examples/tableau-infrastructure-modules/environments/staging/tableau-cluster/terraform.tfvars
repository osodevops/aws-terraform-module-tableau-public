# Account and VPC configuration
account_alias        = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region           = "<YOUR_REGION>"
instance_allowed_ips = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_TABLEAU_INSTANCES>"]
ssh_key_name         = "<YOUR_SSH_KEY_PAIR_NAME>"
vpc_name             = "<YOUR_VPC_NAME>"
environment          = "<YOUR_ENVIRONMENT_NAME>"

# DNS configuration
dns_zone        = "<YOUR_DNS_ZONE>"
is_private_zone = "<IS_YOUR_DNS_ZONE_PRIVATE>"

# ALB configuration
alb_allowed_ips     = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_LOAD_BALANCER>"]
alb_certificate_arn = "<YOUR_ACM_CERTIFICATE_ARN>"
alb_internal        = true

# ASG configuration
common_tags = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  Alarms      = "true"
}

# Lambda configuration
enable_lambdas         = true
create_lambdas         = true
manage_new_nodes       = true
manage_terminations    = true
manage_zookeeper       = true
manage_replicas        = true
maximum_zookeeper_size = 3
