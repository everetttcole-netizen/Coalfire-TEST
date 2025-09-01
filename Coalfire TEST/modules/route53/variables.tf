variable "domain_name" {
  description = "The domain name for public site"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of ALB to point to"
  type        = string
}

variable "alb_zone_id" {
  description = "The hosted zone ID of ALB"
  type        = string
}
