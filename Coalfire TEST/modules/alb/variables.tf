variable "vpc_id" {
  description = "VPC ID for the ALB"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnets for ALB"
  type        = list(string)
}

variable "alb_sg_id" {
  description = "Security group ID to attach to ALB"
  type        = string
}
