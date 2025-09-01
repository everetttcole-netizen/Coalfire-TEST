output "public_subnets" {
  value = aws_subnet.public[*].id
}

output "wp_subnets" {
  value = aws_subnet.wp[*].id
}

output "db_subnets" {
  value = aws_subnet.db[*].id
}