// bastion server 생성

resource "aws_instance" "public_bastion_template" {
  ami           = "ami-0cd680923051b0334"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.bastion_security_group.id]
  key_name = "jy-ec2-keypair"

  tags = {
    Name = "jy-bastion-server"
  }
}

// web server 생성

resource "aws_instance" "private_web_template" {
  ami           = "ami-0cd680923051b0334"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private_app_subnet_1.id
  vpc_security_group_ids = [aws_security_group.webserver_security_group.id]
  key_name = "jy-ec2-keypair"
  user_data = file("./install-apache.sh")

  tags = {
    Name = "jy-web-server"
  }
}
