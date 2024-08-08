// application단 sg 생성

resource "aws_security_group" "webserver_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "Web server SG"
  description = "Enable http/https access(80/443) via ALB & ssh access via bastion sg"


  // Inbound http/https port open
  ingress {
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    security_groups = [aws_security_group.alb_security_group.id]
  }

  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.bastion_security_group.id]
  }

  // Outbound all open
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jy-web-server-sg"
  }
}