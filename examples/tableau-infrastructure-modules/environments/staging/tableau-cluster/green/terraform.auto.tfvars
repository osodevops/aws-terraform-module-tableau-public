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
alb_tags = { "<AN ADDITIONAL TAG NAME>" : "<VALUE>" }
ami_name = "tableau-*"
common_tags = {
  Application = "Tableau"
  Element     = "Tableau Server"
  Purpose     = "Clustered deployment of Tableau server"
  Alarms      = "true"
  Tool        = "Terraform"
  Deployment  = "Green"
}
frontend_domain = "<DOMAIN OF YOUR DEPLOYMENT FRONTEND>"

# RDS configuration
rds_create_database                       = "<DO YOU WANT TO DEPLOY TO AN EXTERNAL RDS INSTANCE>"
rds_instance_class                        = "<DB INSTANCE TYPE OF THE RDS DEPLOYMENT>"
rds_allocated_storage                     = "<SIZE IN GB OF RDS STORAGE>"
rds_max_allocated_storage                 = "<SIZE IN GB OF THE MAXIMUM POSSIBLE ALLOCATED DISK SIZE>"
rds_storage_encrypted                     = "<WHETHER TO ENCRYPT RDS STORAGE AT REST>"
rds_multi_az                              = "<SHOULD RDS BE MULTI-AZ>"
rds_maintenance_window                    = "<DEFINE A MAINTENANCE WINDOW FOR AUTOMATED OS UPDATES>"
rds_backup_window                         = "<DEFINE A BACKUP WINDOW FOR AUTOMATIC RDS BACKUPS>"
rds_backup_retention_period               = "<DAYS TO KEEP AUTOMATED BACKUPS>"
rds_skip_final_snapshot                   = "<CHOOSE WHETHER TO CREATE A FINAL SNAPSHOT ON TEARDOWN>"
rds_deletion_protection                   = "<WHETHER TO PREVENT DESTRUCTION OF THE RDS INSTANCE>"
rds_create_monitoring_role                = "<WHETHER TO CREATE A MONITORING ROLE FOR DS>"
rds_monitoring_role_name                  = "<NAME OF THE ROLE TO CREATE>"
rds_monitoring_interval                   = "<GRANULARITY IN SECONDS OF MONITORING>"
rds_performance_insights_enabled          = "<WHETHER TO ENABLE RDS PERFORMANCE INSIGHTS>"
rds_performance_insights_retention_period = "<TIME IN DAYS TO KEEP PERFORMANCE INSIGHTS>"

# Cluster automation controls
create_lambdas             = "<WHETHER TO CREATE AUTOMATION LAMBDAS IN THE ENVIRONMENT>"
cluster_max_zookeeper_size = "<MAXIMUM SIZE THE COORDINATION SERVICE WILL BE CONFIGURED TO>"
# Example execution schedule: update-window example: configure services between 2 and 4am every friday
# *_schedule = "cron(0/5 2,3 ? * 6 *)"

# Step Function cluster controls
sf_build_enable_automation    = "<ENABLE AUTOMATIC RUNS OF THE STEP FUNCTION CLUSTER BUILD AUTOMATION>"
sf_build_timer_schedule       = "cron(0/5 * * * ? *)" # How often the cluster build automation runs
sf_recovery_enable_automation = "<ENABLE AUTOMATIC RUNS OF THE STEP FUNCTION CLUSTER RECOVERY AUTOMATION>"
sf_recovery_timer_schedule    = "cron(0/10 * * * ? *)" # How often the cluster recovery automation runs

# Protections
force_destroy         = "<WHETHER TO ALLOW S3 BUCKETS TO BE DESTROYED EVEN WHEN FULL>"
asg_force_delete      = "<WHETHER TO FORCE ASG TO IGNORE DELETION PROTECTION ON DESTROY>"
protect_from_scale_in = "<WHETHER TO PROTECT ASG INSTANCES FROM SCALING IN>"