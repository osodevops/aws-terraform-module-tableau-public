output "public_dns_record" {
  description = "User friendly DNS A record for web interface."
  value       = module.dns_selector.public_dns_record
}
