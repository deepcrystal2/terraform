// in nlb sg 생성

resource "aws_security_group" "in_nlb_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "IN-NLB SG"
  description = "Enable 8080 access"


  // Inbound 8080 port open
  ingress {
    description = "8080 access"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_groups = [aws_security_group.webserver_security_group.id]
  }

  // Outbound all open
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jy-in-nlb-sg"
  }
}