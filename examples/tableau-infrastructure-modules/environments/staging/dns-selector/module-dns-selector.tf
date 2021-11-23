module "dns_selector" {
  source                 = "git::ssh://git@github.com/osodevops/aws-terraform-module-tableau.git//modules/dns-selector"
  environment            = var.environment
  dns_zone_public        = var.dns_zone_public
  dns_zone_private       = var.dns_zone_private
  suffix                 = var.suffix
  common_tags            = var.common_tags
  generate_rds_dns_entry = var.generate_rds_dns_entry
}
