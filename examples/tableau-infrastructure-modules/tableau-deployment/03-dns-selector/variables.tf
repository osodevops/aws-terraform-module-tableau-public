variable aws_region {
  description = "The region where you are deploying Tableau"
  type        = string
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

variable suffix {
  description = "The suffix is used to decide which environment to deploy, please choose between `green` or `blue`"
  default     = "green"
}

variable "public_dns_zone" {
  type    = string
  default = ""
}

variable "assume_role" {
  description = "Name of role in peer account to assume"
  default     = "Terraforming-Local-Admin"
}
