module "codebuilder" {
  source                    = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/codebuild-packer"
  common_tags               = var.common_tags
  environment               = var.environment
  encrypt_ami               = var.encrypt_ami
  github_token              = data.aws_ssm_parameter.github_oauth_token.value
  packer_file_location      = var.packer_file_location
  packer_vars_file_location = var.packer_vars_file_location
  project_name              = var.project_name
  source_repository_url     = var.source_repository_url
  vpc_id                    = data.aws_vpc.packer_build_vpc.id
  s3_resource_name          = local.s3_codebuild_storage_name
  subnet_filter             = var.private_subnet_filter
}
