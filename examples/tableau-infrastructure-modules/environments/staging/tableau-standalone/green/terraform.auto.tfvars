# Account and VPC configuration
account_alias        = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region           = "<YOUR_REGION>"
deployment           = "green"
environment          = "<YOUR_ENVIRONMENT_NAME>"
instance_allowed_ips = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_TABLEAU_INSTANCES>"]
ssh_key_name         = "<YOUR_SSH_KEY_PAIR_NAME>"
vpc_name             = "<YOUR_VPC_NAME>"

# DNS configuration
dns_zone        = "<YOUR_DNS_ZONE>"
dns_name        = "green"
is_private_zone = "<IS_YOUR_DNS_ZONE_PRIVATE>"

# ALB configuration
alb_allowed_ips     = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_LOAD_BALANCER>"]
alb_certificate_arn = "<YOUR_ACM_CERTIFICATE_ARN>"
alb_internal        = true

# ASG configuration
alb_tags = {"<AN ADDITIONAL TAG NAME>": "<VALUE>"}
ami_name        = "tableau-*"
asg_desired_capacity = 0
common_tags = {
  Application = "Tableau"
  Element     = "Tableau Server"
  Purpose     = "Standalone deployment of Tableau server"
  Alarms      = "true"
  Tool        = "Terraform"
  Deployment  = "Green"
}
frontend_domain = "<DOMAIN OF YOUR DEPLOYMENT FRONTEND>"
data_volume_size     = "100"
root_disk_size       = "150"
instance_type        = "m5.4xlarge"

# RDS configuration
rds_create_database       = "true"
rds_instance_class          = "db.t3.large"
rds_allocated_storage       = "150"
rds_max_allocated_storage   = "1500"
rds_storage_encrypted       = "true"
rds_multi_az                = "true"
rds_maintenance_window      = ""
rds_backup_window           = ""
rds_backup_retention_period = "7"
rds_skip_final_snapshot     = "true"
rds_deletion_protection     = "false"
rds_create_monitoring_role  = "true"
rds_monitoring_role_name    = "tableau-nonprod-green-monitor-role"
rds_performance_insights_enabled          = "true"
rds_performance_insights_retention_period = "7"

# Trickles down to force destroy S3 buckets
force_destroy = true
asg_force_delete = true
protect_from_scale_in = false