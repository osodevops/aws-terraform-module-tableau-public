variable "account_alias" {
  description = "Name of the account"
  type        = string
}

variable "additional_build_variables" {
  description = "A map of key-values that will be defined as environment variables in the codebuild project"
  type        = map(string)
  default     = {}
}

variable "ami_post_build_commands" {
  description = "Override the default ami post-build commands"
  type        = list(string)
  default     = []
}

variable "aws_region" {
  description = "The AWS region in which all resources will be created"
  type        = string
}

variable "environment" {
  description = "Single prefix of account, examples: M"
  type        = string
}

variable "encrypt_ami" {
  description = "Encrypt AMI after successful build."
  type        = string
}

variable "instance_type" {
  description = "Instance type used by packer to build"
  type        = string
  default     = "m5a.2xlarge"
}

variable "kms_key_arn" {
  description = "If Encrypt_ami set to true then you must pass in the arn of the key you wish to encrypt disk with."
  type        = string
  default     = "Default"
}

variable "packer_file_location" {
  description = "The file path of the .json packer to build."
  type        = string
  default     = "ami/tableau/packer/packfile.json"
}

variable "project_name" {
  description = "Name to give the CodeBuild Project"
  type        = string
}

variable "root_volume_size" {
  description = "Specify the root volume size for the built image"
  type        = string
  default     = "150"
}

variable "shared_ami_users" {
  description = "List of user accounts to share the built AMI with"
  type        = string
  default     = ""
}

variable "source_image_account_no" {
  description = "Account number owning the source image for the packer build"
  type        = string
  default     = "amazon"
}

variable "source_repository_url" {
  description = "The source repository URL of OSO DevOps Tableau module."
  type        = string
}

variable "ssm_path_github_token" {
  description = "Path in SSM Parameter Store of the github OAUTH token"
  type        = string
  default     = ""
}

variable "common_tags" {
  description = "A collection of common tags to be added to resources."
  type        = map(string)
}

variable "vpc_name" {
  description = "Name of the VPC we will deploy into"
  type        = string
}

variable "subnet_name_filter" {
  description = "Tag value used to filter for private subnets we will be building in"
  type        = string
  default     = "Private*"
}

locals {
  s3_codebuild_storage_name = "${var.account_alias}-tableau-ami-resources-${data.aws_caller_identity.current.account_id}-${var.aws_region}"
}
