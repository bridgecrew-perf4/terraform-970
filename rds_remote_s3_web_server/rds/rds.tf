resource "aws_db_instance" "rds-db" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.5"
  instance_class       = var.instance_class
  identifier           = "${var.env}-my-db"
  name                 = "my-database"
  username             = "admin"
  password             = random_password.password.result
  skip_final_snapshot = var.skip_snapshot
  final_snapshot_identifier = var.skip_snapshot == true ? null : "${var.env}-rds-snapshot"
  vpc_security_group_ids    = [aws_security_group.rds_sg.id]
  apply_immediately         = true
  publicly_accessible       = var.env == "dev" ? true : false
}

resource "aws_security_group" "rds_sg" {
  name        = "${var.env}-rds-sg"
  description = "allow from self and local laptop"

  tags = {
    Name = "${var.env}-rds-sg"
  }
}

resource "aws_security_group_rule" "self" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.rds_sg.id
}

resource "aws_security_group_rule" "local_laptop" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "TCP"
  cidr_blocks       = ["108.210.198.102/32"]
  security_group_id = aws_security_group.rds_sg.id
} 