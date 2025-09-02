for use with Coalfire SRE test ONLY
structure is as follows:

project-root/
├── main.tf
├── variables.tf
├── modules/
│   ├── vpc/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── subnets/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── security-groups/
│   │   ├── main.tf        # Defines SG for ALB, ASG, and DB
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── alb/
│   │   ├── main.tf        # Listener on 443, target groups
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── route53/
│   │   ├── main.tf        # DNS record to ALB
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── asg/
│   │   ├── main.tf        # EC2 Auto Scaling Group
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── rds/
│   │   ├── main.tf        # Multi-AZ DB instance
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── alarms/
│       ├── main.tf        # ASG imbalance alarm + RDS alarm
│       ├── variables.tf
│       └── outputs.tf
