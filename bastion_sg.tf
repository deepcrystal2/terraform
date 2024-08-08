// bastion server sg 생성

resource "aws_security_group" "bastion_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "Bastion server access"
  description = "Enable ssh access(22)"


  // Inbound ssh port open
  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_locate]
  }

  // Outbound all open
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jy-bastion-server-sg"
  }
}