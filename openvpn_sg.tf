// bastion server sg 생성

resource "aws_security_group" "openvpn_security_group" {
  vpc_id = aws_vpc.vpc_01.id
  name = "openvpn server access"
  description = "Enable ssh access(22) and vpn(1194) access"


  // Inbound ssh port open
  ingress {
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [var.ssh_locate]
  }

  ingress {
    description = "openvpn access"
    from_port = 1194
    to_port = 1194
    protocol = "udp"
    cidr_blocks = [var.ssh_locate]
  }

  ingress {
    description = "openvpn access"
    from_port = 943
    to_port = 943
    protocol = "tcp"
    cidr_blocks = [var.ssh_locate]
  }

  ingress {
    description = "openvpn access"
    from_port = 443
    to_port = 443
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
    Name = "jy-openvpn-server-sg"
  }
}