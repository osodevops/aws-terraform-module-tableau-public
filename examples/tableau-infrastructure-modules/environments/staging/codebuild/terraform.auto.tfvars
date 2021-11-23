# Account
account_alias = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region    = "<YOUR_REGION>"
common_tags   = {
  Application  = "Tableau"
  Element      = "Codebuild project"
  Purpose      = "Build Tableau AMIs"
  Tool         = "Terraform"
}

# VPC configuration
vpc_filter            = "<NAME OF PARTIAL NAME OF YOUR VPC>"
private_subnet_filter = "<FILTER FOR BUILD SUBNET NAME>"

# Project configuration
encrypt_ami               = true
environment               = "<YOUR_ENVIRONMENT_NAME>"
packer_file_location      = "ami/packfiles/amazon.json"
packer_vars_file_location = "ami/environment/default.json"
project_name              = "tableau-ami"
source_repository_url     = "https://github.com/osodevops/aws-terraform-module-tableau-public"
