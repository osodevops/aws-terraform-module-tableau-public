output "public_dns_record" {
  description = "DNS A record for public domain"
  value       = module.dns_selector.public_dns_record
}

output "private_dns_record" {
  description = "DNS A record for private domain"
  value       = module.dns_selector.private_dns_record
}
