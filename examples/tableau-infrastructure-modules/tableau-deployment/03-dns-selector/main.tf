module "dns_selector" {
  source          = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/dns-selector"
  environment     = var.environment
  public_dns_zone = var.public_dns_zone
  suffix          = var.suffix
  common_tags     = var.common_tags
}
