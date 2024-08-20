# // bastion server 생성
#
# resource "aws_instance" "public_bastion_template" {
#   ami           = "ami-0cd680923051b0334"
#   instance_type = "t2.micro"
#   subnet_id = aws_subnet.public_subnet_1.id
#   vpc_security_group_ids = [aws_security_group.bastion_security_group.id]
#   key_name = "jy-ec2-keypair"
#
#   tags = {
#     Name = "jy-bastion-server"
#   }
# }

// openvpn server 생성

resource "aws_instance" "public_openvpn_template" {
  ami           = "ami-09a093fa2e3bfca5a"  // OpenVPN Access Server 2.13.1 publisher image
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.openvpn_security_group.id]
  key_name = "jy-ec2-keypair"

  tags = {
    Name = "jy-openvpn-server"
  }
}

// 고정 public ip를 위한 openvpn용 eip
resource "aws_eip" "eip_openvpn" {
  instance = aws_instance.public_openvpn_template.id
  domain = "vpc"

  tags = {
    Name = "jy-openvpn-eip"
  }
}


// web server 생성

resource "aws_instance" "private_web_template" {
  ami           = "ami-056a29f2eddc40520"  // Ubuntu Server 22.04 LTS (HVM)
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_web_subnet_1.id
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  key_name = "jy-ec2-keypair"
  user_data = "${file("install-apache.sh")}"

  tags = {
    Name = "jy-web-server"
  }
}

// was server 생성

resource "aws_instance" "private_app_template" {
  ami           = "ami-056a29f2eddc40520"  // Ubuntu Server 22.04 LTS (HVM)
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_app_subnet_1.id
  vpc_security_group_ids = [aws_security_group.wasserver_security_group.id]
  key_name = "jy-ec2-keypair"
  user_data = "${file("install-java.sh")}"

  tags = {
    Name = "jy-was-server"
  }
}
