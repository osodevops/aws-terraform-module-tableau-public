# Account and general
account_alias = "<FRIENDLY_NAME_FOR_THIS_ACCOUNT>"
aws_region    = "<YOUR_REGION>"
common_tags = {
  Application = "Tableau"
  Element     = "CodeBuild"
  Purpose     = "Building of Tableau AMIs"
  Tool        = "Terraform"
}

# VPC configuration
vpc_name           = "<NAME OF YOUR VPC>"
subnet_name_filter = "<FILTER FOR BUILD SUBNET NAME>"

# Project configuration
encrypt_ami           = true
kms_key_arn           = ""
environment           = "<YOUR_ENVIRONMENT_NAME>"
project_name          = "tableau-ami"
source_repository_url = "<URL OF THE AMI BUILD REPO>"
