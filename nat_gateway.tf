// NAT EIP 생성
resource "aws_eip" "eip_nat" {
  domain = "vpc"
  // 해당 eip 를 vpc로 할당한다

  tags = {
    Name = "jy-nat-eip"
  }
}


// NAT GW 생성
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public_subnet_1.id

  tags = {
    Name = "jy-nat-gw"
  }
}