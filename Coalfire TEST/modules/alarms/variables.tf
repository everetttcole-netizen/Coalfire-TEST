variable "rds_instance_id" {
  description = "RDS instance ID to monitor failover"
  type        = string
}

variable "asg_name" {
  description = "ASG name to monitor AZ imbalances"
  type        = string
}

variable "availability_zones" {
  description = "List of AZs to monitor ASG imbalances"
  type        = list(string)
}

variable "sns_topic_arn" {
  description = "SNS topic ARN to send alarm notifications"
  type        = string
}
