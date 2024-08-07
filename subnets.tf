// public subnet 1

resource "aws_subnet" "public_subnet_1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_subnet_1
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "jy-public-subnet-01"
  }
}

// public subnet 2

resource "aws_subnet" "public_subnet_2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_subnet_2
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "jy-public-subnet-02"
  }
}

// private subnet 1 | app-tier

resource "aws_subnet" "private_app_subnet_1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_app_subnet_1
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "jy-private-app-subnet-01"
  }
}

// private subnet 2 | app-tier

resource "aws_subnet" "private_app-subnet_2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_app_subnet_2
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "jy-private-app-subnet-02"
  }
}

// private subnet 1 | db-tier

resource "aws_subnet" "private-db-subnet-1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_db_subnet_1
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch = false

  tags = {
    Name = "jy-private-db-subnet-01"
  }
}

// private subnet 2 | db-tier

resource "aws_subnet" "private-db-subnet-2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private_db_subnet_2
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "jy-private-db-subnet-02"
  }
}

