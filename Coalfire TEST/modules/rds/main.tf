resource "aws_db_subnet_group" "this" {
  name       = var.subnet_group_name
  subnet_ids = var.db_subnets
}

resource "aws_db_instance" "this" {
  identifier             = var.db_identifier
  engine                 = "postgres"
  engine_version         = "11"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  max_allocated_storage  = 20
  storage_type           = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.this.name
  vpc_security_group_ids = var.security_group_ids
  multi_az               = true
  publicly_accessible    = false
  skip_final_snapshot    = true
  backup_retention_period = 0
  deletion_protection    = false
}
