aws_region = "<YOUR_REGION>"
dns_zone_private = "<YOUR PRIVATE DOMAIN>"
dns_zone_public  = "<YOUR PUBLIC DOMAIN>"
common_tags = {
  Application = "Tableau"
  Element     = "DNS selector"
  Tool        = "Terraform"
  Purpose     = "Swap between blue and green deployments"

}
environment            = "<YOUR_ENVIRONMENT_NAME>"
generate_rds_dns_entry = "true"

# blue/green selection
suffix = "blue"

