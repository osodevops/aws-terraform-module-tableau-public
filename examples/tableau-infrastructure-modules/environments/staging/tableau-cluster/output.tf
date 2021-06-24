output "frontend_alb_dns" {
  description = "The CNAME of the ALB to access the web interface."
  value       = module.tableau_server.frontend_alb_dns
}
