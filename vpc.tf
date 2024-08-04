
// vpc 생성
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "jy-vpc"
  }
}

// public, private sn 생성
resource "aws_subnet" "public_subnet_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jy-public-subnet-1"
  }
}

resource "aws_subnet" "public_subnet_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jy-public-subnet-2"
  }
}


resource "aws_subnet" "front_private_subnet_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jy-front-private-subnet-1"
  }
}

resource "aws_subnet" "front_private_subnet_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.4.0/24"

  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jy-front-private-subnet-2"
  }
}

resource "aws_subnet" "back_private_subnet_01" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.5.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "jy-back-private-subnet-1"
  }
}

resource "aws_subnet" "back_private_subnet_02" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.6.0/24"

  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "jy-back-private-subnet-2"
  }
}

// internet gw 생성
resource "aws_internet_gateway" "jy-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "jy-igw"
  }
}

// NGW을 위한 eip 생성
resource "aws_eip" "jy_nat_eip"{
    domain = "vpc"

    lifecycle {
    create_before_destroy = true
  }
}


// NGW 생성
resource "aws_nat_gateway" "jy_ngw" {
    allocation_id = aws_eip.jy_nat_eip.id

    subnet_id = aws_subnet.public_subnet_01.id

    tags = {
        Name = "jy-ngw"
    }
}


// public rt 생성
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  
  // 태그이름 구성
  tags = {
    Name = "jy-public-rt"
  }
}

// public rt 라우팅 정책
resource "aws_route" "public_igw" {
  route_table_id              = aws_route_table.public_route_table.id
  destination_cidr_block      = "0.0.0.0/0"
  gateway_id              = aws_internet_gateway.jy-igw.id
}


// public rt 내 서브넷 연결
resource "aws_route_table_association" "public_route_table_association_1" {
  subnet_id      = aws_subnet.public_subnet_01.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_route_table_association_2" {
  subnet_id      = aws_subnet.public_subnet_02.id
  route_table_id = aws_route_table.public_route_table.id
}

// private rt 생성
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "jy-private-rt"
  }
}

// priavate rt 라우팅 정책
resource "aws_route" "private_ngw" {
  route_table_id              = aws_route_table.private_route_table.id
  destination_cidr_block      = "0.0.0.0/0"
  nat_gateway_id              = aws_nat_gateway.jy_ngw.id
}


// priavate rt 내 서브넷 연결
resource "aws_route_table_association" "private_route_table_association_1" {
  subnet_id      = aws_subnet.front_private_subnet_01.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_2" {
  subnet_id      = aws_subnet.front_private_subnet_02.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_3" {
  subnet_id      = aws_subnet.back_private_subnet_01.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_route_table_association_4" {
  subnet_id      = aws_subnet.back_private_subnet_02.id
  route_table_id = aws_route_table.private_route_table.id
}








