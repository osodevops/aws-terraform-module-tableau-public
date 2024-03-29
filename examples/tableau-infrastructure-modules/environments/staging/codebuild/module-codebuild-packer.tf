module "codebuilder" {
  source                     = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/codebuild-packer"
  account_alias              = var.account_alias
  additional_build_variables = var.additional_build_variables
  ami_post_build_commands    = var.ami_post_build_commands
  common_tags                = var.common_tags
  environment                = var.environment
  encrypt_ami                = var.encrypt_ami
  github_oath_token          = data.aws_ssm_parameter.github_oauth_token.value
  kms_key_arn                = var.kms_key_arn
  instance_type              = var.instance_type
  packer_file_location       = var.packer_file_location
  project_name               = var.project_name
  s3_resource_arn            = module.codebuilder-tableau-s3.s3_arn
  source_repository_url      = var.source_repository_url
  vpc_name                   = var.vpc_name
  shared_ami_users           = var.shared_ami_users
  source_image_account_no    = var.source_image_account_no
  subnet_name_filter         = var.subnet_name_filter
  region                     = var.aws_region
}
