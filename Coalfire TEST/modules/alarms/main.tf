resource "aws_cloudwatch_metric_alarm" "rds_failover" {
  alarm_name          = "RDS_Failover_Alarm"
  alarm_description   = "Alarm if RDS failover occurs (standby becomes primary)"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "DatabaseRole"
  namespace           = "AWS/RDS"
  period              = 60
  statistic           = "Average"
  threshold           = 0.5
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    DBInstanceIdentifier = var.rds_instance_id
  }
}

resource "aws_cloudwatch_metric_alarm" "asg_az_imbalance" {
  for_each = toset(var.availability_zones)

  alarm_name          = "ASG_AZ_Imbalance-${each.key}"
  alarm_description   = "Alarm if AZ ${each.key} has zero healthy in-service instances"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "GroupInServiceInstances"
  namespace           = "AWS/AutoScaling"
  statistic           = "Minimum"
  period              = 60
  threshold           = 1
  alarm_actions       = [var.sns_topic_arn]

  dimensions = {
    AutoScalingGroupName = var.asg_name
    AvailabilityZone     = each.key
  }
}
