output "asg_name" {
  value = aws_autoscaling_group.this.name
}

output "asg_id" {
  description = "The ID of Auto Scaling Group"
  value       = aws_autoscaling_group.this.id
}

output "launch_template_id" {
  description = "The ID of Launch Template"
  value       = aws_launch_template.this.id
}
output "asg_arn" {
  value       = aws_autoscaling_group.this.arn
}
