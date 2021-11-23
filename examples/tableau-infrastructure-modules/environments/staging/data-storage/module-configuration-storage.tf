module "tableau_config_storage" {
  source        = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/configuration-storage"
  aws_region    = var.aws_region
  environment   = var.environment
  common_tags   = var.common_tags
  account_alias = var.account_alias
}
