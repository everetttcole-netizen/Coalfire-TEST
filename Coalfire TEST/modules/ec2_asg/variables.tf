variable "asg_sg_id" {
  description = "Security Group ID for ASG"
  type        = string
}

variable "subnet_ids" {
  description = "List of private subnets for ASG"
  type        = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "volume_size" {
  description = "Root volume size in GB"
  type        = number
  default     = 20
}

variable "desired_capacity" {
  description = "Number of EC2 instances in ASG"
  type        = number
  default     = 2
}

variable "max_size" {
  description = "Maximum number of EC2 instances"
  type        = number
  default     = 2
}

variable "min_size" {
  description = "Minimum number of EC2 instances"
  type        = number
  default     = 2
}

variable "alb_target_group_arn" {
  type        = string
  description = "ARN of ALB target group to attach to ASG"
}