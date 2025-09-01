output "zone_id" {
  description = "ID of Route53 hosted zone"
  value       = aws_route53_zone.public.zone_id
}

output "record_name" {
  description = "DNS record pointing to ALB"
  value       = aws_route53_record.app.fqdn
}
output "app_fqdn" {
  value = aws_route53_record.app.fqdn
}