resource "aws_lb" "this" {
  name               = "tf-alb"
  load_balancer_type = "application"
  subnets            = var.public_subnets
  security_groups    = [var.alb_sg_id]
  enable_deletion_protection = false

  tags = {
    Name = "Coalfire-ALB"
  }
}

resource "aws_lb_target_group" "this" {
  name     = "tf-alb-tg"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = var.vpc_id

  health_check {
    interval            = 30
    path                = "/"
    port                = "443"
    protocol            = "HTTPS"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 5
  }

  tags = {
    Name = "Coalfire ALB Target"
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.this.arn
  port              = 443
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-2016-08" 

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
