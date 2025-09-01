variable "availability_zones" {
  description = "List of availability zones used in the deployment"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}