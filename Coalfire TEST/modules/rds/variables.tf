variable "db_identifier" {
  type = string
}

variable "db_subnets" {
  type = list(string)
}

variable "security_group_ids" {
  type = list(string)
}

variable "subnet_group_name" {
  type    = string
  default = "cf-rds-subnet-group"
}
