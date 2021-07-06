variable "allowed_ips" {
  description = ""
  type        = list(string)
}

variable "restricted_ips" {
  description = ""
  type        = list(string)
  default     = []
}
variable "ami_owner_account" {
  description = "AWS account ID of the AMI owner. Leave blank if you are not sure, defaults to current account."
  type        = string
  default     = ""
}

variable "ami_encrypted" {
  description = "Searching for encrypted AMI's only. Default is false."
  type        = bool
  default     = false
}

variable "alb_ssl_policy" {
  description = "Use of AWS latest TLS policies is best practice. The recommended predefined security policies are: ELBSecurityPolicy-2016-08, ELBSecurityPolicy-FS-2018-06, ELBSecurityPolicy-TLS-1-1-2017-01, ELBSecurityPolicy-TLS-1-2-2017-01 and ELBSecurityPolicy-TLS-1-2-Ext-2018-06."
  type        = string
  default     = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

variable "ui_listener_port" {
  type    = string
  default = "443"
}
variable "ui_listener_protocol" {
  type    = string
  default = "HTTPS"
}
variable "admin_listener_port" {
  type    = string
  default = "8850"
}
variable "admin_listener_protocol" {
  type    = string
  default = "HTTP"
}
variable "environment" {
  type = string
}
variable "root_disk_size" {
  default = "100"
}

variable "instance_type" {
  type    = string
  default = "m5.2xlarge"
}

variable "ssh_key_name" {
  description = "The name of an EC2 Key Pair that can be used to SSH to the EC2 Instances in this cluster. Set to null to not associate a Key Pair."
  type        = string
  default     = null
}

variable "common_tags" {
  type = map(string)
}

variable "alb_certificate_arn" {
  description = "The certificate_arn is the ARN of an ACM or IAM TLS cert to use on this listener"
  type        = string
}

variable "ui_target_group_port" {
  default = "443"
}

variable "ui_target_group_protocol" {
  default = "HTTPS"
}

variable "health_check_path" {
  default = "/"
}

variable "health_check_port" {
  default = "443"
}

variable "health_check_protocol" {
  default = "HTTPS"
}

variable "health_check_timeout" {
  default = 15
}

variable "health_check_matcher" {
  default = "200"
}

variable "alb_internal" {
  type    = bool
  default = false
}

variable "alb_deletion_protection" {
  type    = bool
  default = false
}

variable "alb_logs_s3_prefix" {
  default = "tableau"
}

variable "alb_logs_s3_enabled" {
  type    = bool
  default = true
}

variable "force_destroy" {
  type    = bool
  default = false
}

variable "suffix" {
  default = "green"
}

variable "data_volume_size" {
  default     = "100"
  description = "Size in Gigs of the tableau data volume"
}
variable "data_volume_iops" {
  default = 0
}

variable "data_volume_type" {
  default     = "gp2"
  description = "The type of ebs volume type. e.g. gp2, io1, st1, sc1"
}

variable "asg_min_size" {
  type    = number
  default = 1
}

variable "asg_max_size" {
  type    = number
  default = 1
}

variable "asg_desired_capacity" {
  type    = number
  default = 1
}

variable "licences_key_1" {
  type    = string
  default = ""
}

variable "licences_key_2" {
  type    = string
  default = ""
}

variable "licences_key_3" {
  type    = string
  default = ""
}

variable "admin_password" {
  description = "Web UI admin password of the default user. Must be 8 alphanumeric 8 characters."
  type        = string
}

variable "server_password" {
  description = "The tableau user is created on the Linux operating system by defualt, you can set the password here. To use the TSM you will need to switch to this user. Must be 8 alphanumeric 8 characters."
  type        = string
}

locals {
  alb_bucket_name  = "tableau-${var.suffix}-${lower(var.environment)}-${data.aws_caller_identity.current.account_id}-alb-access-logs"
  vpc_sg_map       = zipmap(data.aws_security_group.vpc_sg.*.name, data.aws_security_group.vpc_sg.*.id)
  ami_name         = var.ami_encrypted ? "ENC-TABLEAU-*" : "TABLEAU-*"
  ami_owner        = var.ami_owner_account != "" ? var.ami_owner_account : data.aws_caller_identity.current.account_id
  parameter_prefix = "/${var.environment}/${var.suffix}"

  # TABLEAU LICENCE KEYS. Stored in SSM Parameter but is ignored if value is empty.
  licences_1_param = [{
    name        = "${local.parameter_prefix}/tableau/licences/1"
    type        = "SecureString"
    value       = var.licences_key_1
    description = "Production Tableau licence key 1"
    overwrite   = false
  }]

  licences_2_param = [{
    name        = "${local.parameter_prefix}/tableau/licences/2"
    type        = "SecureString"
    value       = var.licences_key_2
    description = "Production Tableau licence key 2"
    overwrite   = false
  }]

  licences_3_param = [{
    name        = "${local.parameter_prefix}/tableau/licences/3"
    type        = "SecureString"
    value       = var.licences_key_3
    description = "Production Tableau licence key 3"
    overwrite   = false
  }]

  admin_password_param = [{
    name        = "${local.parameter_prefix}/tableau/users/admin_password"
    type        = "SecureString"
    value       = var.admin_password
    description = "Tableau web admin password"
    overwrite   = false
  }]

  server_password_param = [{
    name        = "${local.parameter_prefix}/tableau/users/server_password"
    type        = "SecureString"
    value       = var.server_password
    description = "Tableau cmd server password"
    overwrite   = false
  }]
}