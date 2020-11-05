resource "aws_security_group" "rds" {
  name = format("%s-rds-sg", var.name)

  vpc_id = module.vpc.vpc_id

  ingress {
    from_port = var.db_port
    to_port   = var.db_port
    protocol  = "tcp"
    cidr_blocks = module.vpc.private_subnets_cidr_blocks
  }

  tags = {
    Group = var.name
    Name  = "db-sg"
  }
}

module "aurorasqldb" {
  source  = "terraform-aws-modules/rds-aurora/aws"

  engine            = var.db_engine
  engine_version    = var.db_engine_version
  instance_class    = var.db_instance_class
  allocated_storage = var.db_allocated_storage
  name              = var.db_name
  username = var.db_username
  password = var.db_password
  port     = var.db_port

  vpc_security_group_ids = [aws_security_group.rds.id]
  replica_count                   = 3
  instance_type                   = var.db_instance_class
  db_parameter_group_name         = "default"
  db_cluster_parameter_group_name = "default"

  #subnet_ids                      = [aws_subnet.public-subnet.id]
  #azs                             = ["us-east-1a", "us-east-1b"]
  #maintenance_window = var.db_maintenance_window
  #backup_window      = var.db_backup_window

  tags = {
    Group = var.name
    Name  = "db-auroraSQL"
  }
}