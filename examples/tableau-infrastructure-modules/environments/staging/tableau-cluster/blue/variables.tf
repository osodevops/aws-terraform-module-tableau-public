variable "account_alias" {
  description = "Friendly name of your account"
  type        = string
}

variable "alb_allowed_ips" {
  description = "List of external IPs that will be allowed access to the Tableau ALB"
  type        = list(string)
  default     = []
}

variable "alb_certificate_arn" {
  description = "ARN of the certificate to be assigned to the Load Bancer"
  type        = string
}

variable "alb_deletion_protection" {
  description = "Prevent deletion of load balancers"
  type        = bool
  default     = false
}

variable "alb_internal" {
  description = "Force load-balancers to be internal"
  type        = string
  default     = false
}

variable "alb_tags" {
  description = "map of tags specifically for the ALB."
  type        = map(string)
  default     = {}
}

variable "ami_name" {
  description = "Provide a name to the AMI that will be used, the string will act as the filter"
  type        = string
}

variable "asg_force_delete" {
  description = "Forces deletion of the ASGs"
  type        = bool
  default     = false
}

variable "aws_region" {
  description = "The AWS region the bucket is to be created in"
  type        = string
  default     = "eu-west-2"
}

variable "cluster_max_zookeeper_size" {
  description = "Limit the maximum size of the zookeeper cluster"
  type        = number
  default     = 3
}

variable "common_tags" {
  description = "Map of tags that will be applied to all infrastructure created by the Tableau module"
  type        = map(string)
  default     = {}
}

variable "create_lambdas" {
  description = "Boolean to turn on/off creation of lambdas"
  type        = bool
  default     = true
}

variable "deployment" {
  description = "Name of the deployment type: green or blue"
  type        = string
  default     = ""
}

variable "dns_name" {
  description = "Name to be appended to the route53 domain for this ALB"
  type        = string
  default     = "tableau"
}

variable "dns_zone" {
  description = "The zone we are configuring e.g. myplace.cloud"
  type        = string
  default     = "cloud"
}

variable "environment" {
  description = "Name of the environment we are deploying Tableau into. e.g. 'stage'"
  type        = string
}

variable "force_destroy" {
  description = "Boolean that will delete all data from the S3 buckets used as part of the Tableau cluster. This is for teardown only"
  type        = bool
  default     = false
}

variable "frontend_domain" {
  description = "Domain that will be used by end-users to access the cluster"
  type        = string
}

variable "instance_allowed_ips" {
  description = "List of customer internal IPs allowed to access the Tableau instances"
  type        = list(string)
  default     = []
}

variable "is_private_zone" {
  description = "Set according to if your hosted zone is public or private"
  type        = bool
  default     = false
}

variable "lambda_enable_automation" {
  description = "Boolean to turn on/off automatic execution of lambdas"
  type        = bool
  default     = false
}

variable "lambda_manage_zookeeper" {
  description = "Allow the configurator lambda to manage zookeeper"
  type        = bool
  default     = false
}

variable "lambda_manage_new_nodes" {
  description = "Allow the configurator lambda to manage new cluster nodes"
  type        = bool
  default     = false
}

variable "lambda_manage_terminations" {
  description = "Allow the configurator lambda to manage node terminations"
  type        = bool
  default     = false
}

variable "lambda_manage_replicas" {
  description = "Allow the configurator lambda to manage repo-replica placement"
  type        = bool
  default     = false
}

variable "lambda_execution_schedule" {
  description = "Determines when the configuration lambda is executed."
  type        = string
  default     = "cron(0/5 * * * ? *)"
}

variable "protect_from_scale_in" {
  description = "Do not allow the ASGs to scale in instances. Prevents accidental data-loss"
  type        = bool
  default     = true
}

variable "rds_allocated_storage" {
  description = "What is the minimum allocated storage of the RDS instance in GB"
  default     = "150"
  type        = string
}

variable "rds_backup_window" {
  default = "03:00-06:00"
  type    = string
}

variable "rds_backup_retention_period" {
  description = "Set the backup retention period for the RDS instance"
  default     = "7"
  type        = string
}

variable "rds_create_database" {
  description = "Would you like Tableau to use an external database?"
  default     = false
  type        = bool
}

variable "rds_create_monitoring_role" {
  description = "Do you want RDS to create the monitoring role automatically?"
  default     = true
  type        = bool
}

variable "rds_db_name" {
  description = "Do you want to create an initial database on the RDS instance?"
  default     = ""
  type        = string
}

variable "rds_deletion_protection" {
  description = "Set if you want delete protection for your RDS instance"
  default     = false
  type        = bool
}

variable "rds_engine" {
  description = "Set the engine for RDS to use"
  default     = "postgres"
  type        = string
}

variable "rds_engine_version" {
  description = "Set the full version of the database"
  default     = "12.8"
  type        = string
}

variable "rds_family" {
  description = "Set a DB parameter group family"
  default     = "postgres12"
  type        = string
}

variable "rds_instance_class" {
  description = "Set the RDS instance size"
  default     = "db.t3.large"
  type        = string
}

variable "rds_major_engine_version" {
  description = "Set the major version of the database"
  default     = "12"
  type        = string
}

variable "rds_maintenance_window" {
  description = "Set the RDS maintenance window"
  default     = "Mon:00:00-Mon:03:00"
  type        = string
}

variable "rds_max_allocated_storage" {
  description = "What is the maximum allocated storage of the RDS instance in GB"
  default     = "1500"
  type        = string
}

variable "rds_monitoring_interval" {
  description = "Granularity of how often metrics are captured from the RDS instance"
  default     = "30"
  type        = string
}

variable "rds_monitoring_role_name" {
  description = "Set the name of the RDS monitoring role"
  default     = "MyRDSMonitoringRole"
  type        = string
}

variable "rds_multi_az" {
  description = "Should the RDS run in multi-AZ mode"
  default     = "false"
  type        = bool
}

variable "rds_performance_insights_enabled" {
  description = "Enable Performance Insights on the RDS instance"
  default     = true
  type        = bool
}

variable "rds_performance_insights_retention_period" {
  description = "Set the retention period for RDS performance insights"
  default     = "7"
  type        = string
}

variable "rds_skip_final_snapshot" {
  description = "Do you wish to createa final snapshot for RDS"
  default     = true
  type        = bool
}

variable "rds_storage_encrypted" {
  description = "Do you want to encrypt the RDS disk storage"
  default     = true
  type        = bool
}

variable "sf_build_enable_automation" {
  description = "Enable automatic runs of the Step Function cluster build automation"
  default     = false
  type        = bool
}

variable "sf_build_timer_schedule" {
  description = "How often the cluster build automation runs"
  type        = string
  default     = "cron(0/5 * * * ? *)"
}

variable "sf_recovery_enable_automation" {
  description = "Enable automatic runs of the Step Function cluster recovery automation"
  default     = false
  type        = bool
}

variable "sf_recovery_timer_schedule" {
  description = "How often the cluster recovery automation runs"
  type        = string
  default     = "cron(0/10 * * * ? *)"
}

variable "ssh_key_name" {
  description = "Name of the SSH key used for the Tableau instances"
  type        = string
  default     = null
}

variable "vpc_name" {
  description = "Name of the VPC we will deploy into"
  type        = string
}
