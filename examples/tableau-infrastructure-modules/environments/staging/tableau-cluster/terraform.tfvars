# Account and VPC configuration
account_alias        = "<FRIENDLY NAME FOR YOUR AWS ACCOUNT>"
aws_region           = "<YOUR REGION>"
instance_allowed_ips = ["<CIDR BLOCKS ALLOWED ACCESS TO TABLEAU INSTANCES>",]
ssh_key_name         = "<YOUR SSH KEY-PAIR NAME>"
vpc_name             = "<YOUR VPC NAME>"
environment          = "<YOUR ENVIRONMENT NAME HERE>"

# DNS configuration
dns_zone             = "test.osodevops.io"
is_private_zone      = false

# ALB configuration
alb_allowed_ips     = ["<CIDR BLOCKS ALLOWED ACCESS TO TABLEAU ALB>",]
alb_certificate_arn = "<YOUR ACM CERTIFICATE ARN>"
alb_internal        = true

# ASG configuration
asg_desired_capacity = 3
asg_max_size         = 3
common_tags          = {
  Application = "Tableau Server"
  CostCode = "Tableau"
  Tool = "Terraform"
  Alarms = "true"
}
data_volume_size     = "100"
instance_type        = "m5.4xlarge"
root_disk_size       = "150"

# Lambda configuration
enable_lambdas         = true
create_lambdas         = true
manage_new_nodes       = true
manage_terminations    = true
manage_zookeeper       = true
manage_replicas        = true
maximum_zookeeper_size = 3
