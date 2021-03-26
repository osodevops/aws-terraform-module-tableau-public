variable admin_password {
  description = "Admin password to be set on the Tableau installation"
  type        = string
}

variable server_password {
  description = "Password for access to the Tableau instances"
  type        = string
}

variable licences_key_1 {
  description = "License key for your Tableau installation"
  type        = string
}

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

variable suffix {
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