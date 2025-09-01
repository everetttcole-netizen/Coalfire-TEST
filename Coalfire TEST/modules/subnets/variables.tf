variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "azs" {
  description = "List of Availability Zones"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "List of CIDRs for public subnets"
  type        = list(string)
  default     = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "wp_subnet_cidrs" {
  description = "List of CIDRs for Web App subnets (private)"
  type        = list(string)
  default     = ["10.1.2.0/24", "10.1.3.0/24"]
}

variable "db_subnet_cidrs" {
  description = "List of CIDRs for database subnets (private)"
  type        = list(string)
  default     = ["10.1.4.0/24", "10.1.5.0/24"]
}

variable "igw_id" {
  description = "Internet Gateway ID from VPC module"
  type        = string
}
