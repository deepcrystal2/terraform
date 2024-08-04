provider "aws" {
  region = "ap-northeast-2"
}


resource "aws_instance" "jy-app-ubuntu" {
  ami           = "ami-056a29f2eddc40520"
  instance_type = "t2.micro"

  tags = {
    Name = "jy-app-ubuntu"
  }
}
