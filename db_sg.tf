// db단 sg 생성

resource "aws_security_group" "database_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "Database server SG"
  description = "Enable MySQL access via web sg"


  // Inbound http/https port open
  ingress {
    description = "mysql access"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = [aws_security_group.wasserver_security_group.id]
  }

  // Outbound all open
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jy-db-mysql-sg"
  }
}