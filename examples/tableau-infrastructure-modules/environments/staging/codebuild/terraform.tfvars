# Account
account_alias = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region    = "<YOUR_REGION>"
common_tags = {
  Application  = "CodeBuild"
  CostCode     = "Tableau"
  Tool         = "Terraform"
  StackVersion = "1.0"
}

# VPC configuration
vpc_class_filter           = "tableau-build"
packer_subnet_class_filter = "tableau-build"

# Project configuration
encrypt_ami               = true
environment               = "<YOUR_ENVIRONMENT_NAME>"
packer_file_location      = "ami/packfiles/amazon.json"
packer_vars_file_location = "ami/environment/default.json"
project_name              = "tableau"
source_repository_url     = "<YOUR_AMI_BUILD_REPO>"
