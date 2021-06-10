module "dns_selector" {
  source          = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/dns-selector"
  environment     = var.environment
  dns_zone        = var.dns_zone
  suffix          = var.suffix
  common_tags     = var.common_tags
  is_private_zone = var.is_private_zone
}
