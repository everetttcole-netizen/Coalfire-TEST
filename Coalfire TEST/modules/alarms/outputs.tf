output "rds_failover_alarm_name" {
  value = aws_cloudwatch_metric_alarm.rds_failover.alarm_name
}

output "asg_az_imbalance_alarm_names" {
  value = [for a in aws_cloudwatch_metric_alarm.asg_az_imbalance : a.alarm_name]
}
