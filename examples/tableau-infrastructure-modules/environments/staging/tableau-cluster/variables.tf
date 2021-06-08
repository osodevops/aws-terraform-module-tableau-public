variable alb_allowed_ips {
  description = "List of external IPs that will be allowed access to the Tableau ALB"
  type        = list(string)
  default     = []
}

variable common_tags {
  description = "Map of tags that will be applied to all infrastructure created by the Tableau module"
  type        = map(string)
  default     = {}
}

variable environment {
  description = "Name of the environment we are deploying Tableau into. e.g. 'stage'"
  type        = string
}

variable ssh_key_name {
  description = "Name of the SSH key used for the Tableau instances"
  type        = string
  default     = null
}

variable alb_certificate_arn {
  description = "ARN of the certificate to be assigned to the Load Bancer"
  type        = string
}

variable alb_deletion_protection {
  description = "Prevent deletion of load balancers"
  type        = bool
  default     = false
}

variable instance_type {
  description = "Instance type used for the Tableau servers"
  type        = string
  default     = "m5.4xlarge"
}

variable instance_allowed_ips {
  description = "List of customer internal IPs allowed to access the Tableau instances"
  type        = list(string)
  default     = []
}

variable deployment {
  description = "Name of the deployment type: green or blue"
  type        = string
  default     = ""
}

variable force_destroy {
  description = "Boolean that will delete all data from the S3 buckets used as part of the Tableau cluster. This is for teardown only"
  type        = bool
  default     = false
}

variable root_disk_size {
  description = "Size of the Tableau root partition in GB"
  type        = string
  default     = "100"
}

variable data_volume_size {
  description = "Size of the Tableau EBS data volume in GB"
  type        = string
  default     = "100"
}

variable aws_region {
  description = "The AWS region the bucket is to be created in"
  type        = string
  default     = "eu-west-2"
}

variable vpc_name {
  description = "Name of the VPC we will deploy into"
  type        = string
}

variable alb_internal {
  description = "Force load-balancers to be internal"
  type        = string
  default     = false
}

variable account_alias {
  type = string
}

variable is_private_zone {
  type = bool
}

variable dns_zone {
  type = string
}

variable "asg_max_size" {
  type    = number
  default = 1
}

variable "asg_desired_capacity" {
  type    = number
  default = 1
}

variable "enable_lambdas" {
  description = "Boolean to turn on/off automatic execution of lambdas"
  type        = bool
  default     = true
}

variable "create_lambdas" {
  description = "Boolean to turn on/off creation of lambdas"
  type        = bool
  default     = true
}

variable "maximum_zookeeper_size" {
  description = "Limit the maximum size of the zookeeper cluster"
  type = number
  default = 3
}

variable "manage_zookeeper" {
  description = "Allow the configurator lambda to manage zookeeper"
  type        = bool
  default     = true
}

variable "manage_new_nodes" {
  description = "Allow the configurator lambda to manage new cluster nodes"
  type        = bool
  default     = true
}

variable "manage_terminations" {
  description = "Allow the configurator lambda to manage node terminations"
  type        = bool
  default     = true
}

variable "manage_replicas" {
  description = "Allow the configurator lambda to manage repo-replica placement"
  type        = bool
  default     = true
}