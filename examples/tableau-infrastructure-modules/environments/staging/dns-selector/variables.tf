variable "aws_region" {
  description = "The region where you are deploying Tableau"
  type        = string
}

variable "common_tags" {
  description = "Map of tags that will be applied to all infrastructure created by the Tableau module"
  type        = map(string)
  default     = {}
}

variable "environment" {
  description = "Name of the environment we are deploying Tableau into. e.g. 'stage'"
  type        = string
}

variable "suffix" {
  description = "The suffix is used to decide which environment to deploy, please choose between `green` or `blue`"
  default     = "green"
}

variable "dns_zone_public" {
  description = "Public zone to update with frontend tableau entry"
  type        = string
  default     = ""
}

variable "dns_zone_private" {
  description = "Private zone to update with frontend tableau entry"
  type        = string
  default     = ""
}

variable "generate_rds_dns_entry" {
  description = "If you are using an external RDS instance, set this value to true"
  default     = false
  type        = bool
}