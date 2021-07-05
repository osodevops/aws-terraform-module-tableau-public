variable "account_alias" {
  description = "Name of the account"
  type        = string
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
variable "kms_key_arn" {
  description = "If Encrypt_ami set to true then you must pass in the arn of the key you wish to encrypt disk with."
  type        = string
  default     = "Default"
}
variable "packer_file_location" {
  description = "The file path of the .json packer to build."
  type        = string
}
variable "packer_vars_file_location" {
  description = "The file path to where extra Packer vars can be referenced"
  type        = string
}
variable "project_name" {
  description = "Name to give the CodeBuild Project"
  type        = string
}
variable "source_repository_url" {
  description = "The source repository URL of OSO DevOps Tableau module."
  type        = string
}
variable "common_tags" {
  description = "A collection of common tags to be added to resources."
  type        = map(string)
}

variable "vpc_class_filter" {
  description = "Used to filter by 'Class' tag for the VPC we will be building in"
  type        = string
  default     = "tableau-build"
}

variable "packer_subnet_class_filter" {
  description = "Used to filter by 'Class' tag for the subnets we will be building in"
  type        = string
  default     = "tableau-build"
}

locals {
  s3_codebuild_storage_name = "${var.account_alias}-${var.aws_region}-tableau-codebuild-resources"
}
