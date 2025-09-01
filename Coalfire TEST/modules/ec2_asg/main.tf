data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "aws_launch_template" "this" {
  name_prefix   = "tf-asg-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = var.volume_size
      volume_type = "gp3"
    }
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [var.asg_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Coalfire-Instance"
    }
  }
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.subnet_ids
  target_group_arns = [var.alb_target_group_arn]
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "tf-asg-instance"
    propagate_at_launch = true
  }
}
