# Account and VPC configuration
account_alias        = "<FRIENDLY NAME FOR YOUR AWS ACCOUNT>"
aws_region           = "<YOUR REGION>"
common_tags          = {
  Application = "Tableau Server"
  CostCode    = "Tableau"
  Tool        = "Terraform"
  Alarms      = "true"
  Deployment  = "Green"
}
instance_allowed_ips = ["<CIDR BLOCKS ALLOWED ACCESS TO TABLEAU INSTANCES>",]
ssh_key_name         = "<YOUR SSH KEY-PAIR NAME>"
vpc_name             = "<YOUR VPC NAME>"
environment          = "<YOUR ENVIRONMENT NAME HERE>"

# DNS configuration
dns_zone             = "<YOUR DOMAIN HERE>"
is_private_zone      = false

# ALB configuration
alb_allowed_ips     = ["<CIDR BLOCKS ALLOWED ACCESS TO TABLEAU ALB>",]
alb_certificate_arn = "<YOUR ACM CERTIFICATE ARN>"
alb_internal        = true

# ASG configuration
asg_desired_capacity = 0
data_volume_size     = "100"
root_disk_size       = "150"
deployment           = "green"
instance_type        = "m5.4xlarge"
