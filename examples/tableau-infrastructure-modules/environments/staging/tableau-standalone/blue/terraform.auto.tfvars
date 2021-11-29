# Account and VPC configuration
account_alias        = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region           = "<YOUR_REGION>"
deployment           = "blue"
environment          = "<YOUR_ENVIRONMENT_NAME>"
instance_allowed_ips = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_TABLEAU_INSTANCES>"]
ssh_key_name         = "<YOUR_SSH_KEY_PAIR_NAME>"
vpc_name             = "<YOUR_VPC_NAME>"

# DNS configuration
dns_zone        = "<YOUR_DNS_ZONE>"
dns_name        = "blue"
is_private_zone = "<IS_YOUR_DNS_ZONE_PRIVATE>"

# ALB configuration
alb_allowed_ips     = ["<YOUR_CIDR_BLOCKS_ALLOWED_TO_LOAD_BALANCER>"]
alb_certificate_arn = "<YOUR_ACM_CERTIFICATE_ARN>"
alb_internal        = "<IS THE LOAD BALANCER INTERNALLY OR EXTERNALLY FACING>"

# ASG configuration
alb_tags             = { "<AN ADDITIONAL TAG NAME>" : "<VALUE>" }
ami_name             = "tableau-*"
asg_desired_capacity = 0
common_tags = {
  Application = "Tableau"
  Element     = "Tableau Server"
  Purpose     = "Standalone deployment of Tableau server"
  Alarms      = "true"
  Tool        = "Terraform"
  Deployment  = "Blue"
}
frontend_domain  = "<DOMAIN OF YOUR DEPLOYMENT FRONTEND>"
data_volume_size = "<SIZE IN GB OF THE TABLEAU DATA VOLUME>"
root_disk_size   = "<SIZE IN GB OF THE TABLEAU ROOT OS VOLUME>"
instance_type    = "<INSTANCE TYPE OF TABLEAU>"

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
rds_performance_insights_enabled          = "<WHETHER TO ENABLE RDS PERFORMANCE INSIGHTS>"
rds_performance_insights_retention_period = "<TIME IN DAYS TO KEEP PERFORMANCE INSIGHTS>"

# Protections
force_destroy         = "<WHETHER TO ALLOW S3 BUCKETS TO BE DESTROYED EVEN WHEN FULL>"
asg_force_delete      = "<WHETHER TO FORCE ASG TO IGNORE DELETION PROTECTION ON DESTROY>"
protect_from_scale_in = "<WHETHER TO PROTECT ASG INSTANCES FROM SCALING IN>"