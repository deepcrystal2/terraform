// public route table

resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "jy-public-rt"
  }
}

// public route table association

resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public_subnet_1.id
}

resource "aws_route_table_association" "public-subnet-2-route-table-association" {
  route_table_id = aws_route_table.public-route-table.id
  subnet_id = aws_subnet.public_subnet_2.id
}