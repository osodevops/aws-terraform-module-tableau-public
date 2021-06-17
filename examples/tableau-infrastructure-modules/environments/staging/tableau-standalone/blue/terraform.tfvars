# Account and VPC configuration
account_alias = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region    = "<YOUR_REGION>"
common_tags = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  Alarms      = "true"
  Deployment  = "Blue"
}
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
asg_desired_capacity = 0
data_volume_size     = "100"
root_disk_size       = "150"
deployment           = "blue"
instance_type        = "m5.4xlarge"
