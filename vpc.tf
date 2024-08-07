// vpc 생성

resource "aws_vpc" "vpc_01" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "jy-vpc"
  }
}