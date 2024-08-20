// ex alb sg 생성

resource "aws_security_group" "ex_alb_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "EX-ALB SG"
  description = "Enable http/https access(80/443)"


  // Inbound http/https port open
  ingress {
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  // Outbound all open
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jy-ex-alb-sg"
  }
}