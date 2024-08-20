// web단 sg 생성

resource "aws_security_group" "wasserver_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "WAS server SG"
  description = "Enable access(8080) via ALB"


  // Inbound 8080 port open
  ingress {
    description = "springboot access"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    security_groups = [aws_security_group.in_nlb_security_group.id]
  }

  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    security_groups = [aws_security_group.openvpn_security_group.id]
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
    Name = "jy-was-server-sg"
  }
}