variable "account_alias" {
  description = "Friendly name of the account we are configuring"
  type        = string
}

variable "aws_region" {
  description = "The AWS region of the bucket"
  type        = string
  default     = "eu-west-2"
}

variable "environment" {
  description = "The name of the environment"
  type        = string
}

variable "common_tags" {
  description = "Map of tags to be included on all resources created by this module"
  type        = map(string)
  default     = {}
}
