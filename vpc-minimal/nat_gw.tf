# Define the NAT gateway
resource "aws_eip" "eip_nat1" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw1" {
  allocation_id = aws_eip.eip_nat1.id
  subnet_id = aws_subnet.public_subnet1.id
  depends_on = [aws_internet_gateway.gw]
}