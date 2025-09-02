########################################
# Root main.tf — Coalfire-TEST
########################################

module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  azs    = ["us-east-1a", "us-east-1b"]
  igw_id = module.vpc.igw_id
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.subnets.public_subnets
  alb_sg_id      = module.security_groups.alb_sg_id
}

module "ec2_asg" {
  source       = "./modules/ec2_asg"
  alb_target_group_arn = module.alb.target_group_arn
  subnet_ids   = module.subnets.wp_subnets
  asg_sg_id    = module.security_groups.asg_sg_id
  desired_capacity = 2
  max_size = 2
  min_size = 2
}

module "rds" {
  source             = "./modules/rds"
  db_identifier      = "cf-poc-db"
  db_subnets         = module.subnets.db_subnets
  security_group_ids = [module.security_groups.db_sg_id]
}


#Route53 module commented out for reference only
#module "route53" {
 # source      = "./modules/route53"
 # domain_name = "clientapp.com"
 # alb_dns_name = module.alb.dns_name
 # alb_zone_id  = module.alb.zone_id
# }

module "alarms" {
  source             = "./modules/alarms"
  rds_instance_id    = module.rds.db_instance_id
  asg_name           = module.ec2_asg.asg_name
  sns_topic_arn      = aws_sns_topic.alerts.arn
  availability_zones = var.availability_zones
}

resource "aws_sns_topic" "alerts" {
  name = "app-alerts-topic"
}

