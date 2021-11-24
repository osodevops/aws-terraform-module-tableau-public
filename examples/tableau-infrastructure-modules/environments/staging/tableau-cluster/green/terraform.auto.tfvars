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
common_tags = {
  Application = "Tableau"
  Element     = "Tableau Server"
  Purpose     = "Clustered deployment of Tableau server"
  Alarms      = "true"
  Tool        = "Terraform"
}

alb_tags = {"<AN ADDITIONAL TAG NAME>": "<VALUE>"}
frontend_domain = "<DOMAIN OF YOUR DEPLOYMENT FRONTEND>"
ami_name        = "tableau-*"

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

# Cluster automation controls
create_lambdas         = true     # Whether to create automation lambdas in the environment
cluster_max_zookeeper_size = 5        # Maximum size the coordination service will be configured to
# Example execution schedule: update-window example: configure services between 2 and 4am every friday
# *_schedule = "cron(0/5 2,3 ? * 6 *)"

# Legacy cluster controls
lambda_enable_automation            = false    # Enable the legacy lambda cluster automation
lambda_manage_new_nodes          = true     # Should the automation configure new nodes
lambda_manage_terminations       = true     # Should the automation repair dead cluster nodes
lambda_manage_zookeeper          = true     # Should the automation configure zookeeper
lambda_manage_replicas           = false    # Should the automation distribute internal replicas across the cluster
lambda_execution_schedule = "cron(0/5 * * * ? *)"   # How often the automation lambda checks the cluster state

# Step Function cluster controls
sf_build_enable_automation  = true                    # Enable automatic runs of the Step Function cluster build automation
sf_build_timer_schedule = "cron(0/5 * * * ? *)"       # How often the cluster build automation runs
sf_recovery_enable_automation = true                  # Enable automatic runs of the Step Function cluster recovery automation
sf_recovery_timer_schedule = "cron(0/10 * * * ? *)"   # How often the cluster recovery automation runs


# Trickles down to force destroy S3 buckets
force_destroy = true
asg_force_delete = true
protect_from_scale_in = false