// private route table

resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc_01.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "jy-private-rt"
  }
}

// private route table association

resource "aws_route_table_association" "private-web-subnet-1-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_web_subnet_1.id
}

resource "aws_route_table_association" "private-web-subnet-2-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_web_subnet_2.id
}

resource "aws_route_table_association" "private-app-subnet-1-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_app_subnet_1.id
}

resource "aws_route_table_association" "private-app-subnet-2-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private_app-subnet_2.id
}

resource "aws_route_table_association" "private-db-subnet-1-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-db-subnet-1.id
}

resource "aws_route_table_association" "private-db-subnet-2-route-table-association" {
  route_table_id = aws_route_table.private-route-table.id
  subnet_id = aws_subnet.private-db-subnet-2.id
}