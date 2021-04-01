variable "account_name" {
  description = "A common account name"
  type        = string
}

variable "region" {
  description = "Region where we are creating the VPC"
  type        = string
}

variable "cidr" {
  description = "The CIDR block to be associated to the VPC"
  type        = string
}

variable "environment" {
  description = "Name for this environment. e.g. staging"
  type        = string
}

variable "common_tags" {
  description = "Map of common tags to add to every resource"
  type        = map(string)
}

variable "zone" {
  description = "A list of zomes used for this deployment"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "vpc_endpoint_cloudwatch_enabled" {
  description = "Boolean to turn on/off cloudwatch endpoint"
  type        = number
  default     = 0
}

variable "vpc_endpoint_cloudwatch_log_enabled" {
  description = "Boolean to turn on/off cloudwatch logs endpoint"
  type        = number
  default     = 0
}

variable "vpc_endpoint_ec2_enabled" {
  description = "Boolean to turn on/off ec2 endpoint"
  type        = number
  default     = 0
}

variable "vpc_endpoint_s3_enabled" {
  description = "Boolean to turn on/off s3 endpoint"
  type        = number
  default     = 0
}

variable "vpc_endpoint_ssm_enabled" {
  description = "Boolean to turn on/off ssm endpoint"
  type        = number
  default     = 0
}
