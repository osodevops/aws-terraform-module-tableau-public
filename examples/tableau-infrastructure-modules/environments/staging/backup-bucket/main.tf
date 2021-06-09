module "tableau_backup_config" {
//  source      = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/backup-config"
  source = "/home/asing/Client/OSO/aws-terraform-module-tableau//modules/backup-config"
  aws_region  = var.aws_region
  environment = var.environment
  common_tags = var.common_tags
  account_alias = var.account_alias
}
