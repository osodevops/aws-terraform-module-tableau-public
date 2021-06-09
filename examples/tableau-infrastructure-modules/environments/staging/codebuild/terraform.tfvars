# Account
account_alias = "<AN ALIAS FOR YOUR ACCOUNT HERE>"
aws_region    = "<YOUR REGION>"
common_tags   = {
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
environment               = "<YOUR ENVIRONMENT NAME>"
packer_file_location      = "ami/packfiles/amazon.json"
packer_vars_file_location = "ami/environment/default.json"
project_name              = "<NAME OF THE CODEBUILD PROJECT>"
source_repository_url     = "<YOUR AMI BUILD REPO HERE>"
