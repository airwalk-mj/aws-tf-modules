# Define the Public route table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags {
    name = "Public Subnet Route Table"
  }
}
# Associte the Public route table with all Public Subnets
resource "aws_route_table_association" "public-rt1" {
  subnet_id = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public-rt
}
resource "aws_route_table_association" "public-rt2" {
  subnet_id = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public-rt
}


# Define the Private route table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw1.id
  }

  tags {
    name = "Private Subnet Route Table"
  }
}
# Associte the Private route table with all Private Subnets
resource "aws_route_table_association" "private-rt1" {
  subnet_id = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.public-rt
}
resource "aws_route_table_association" "private-rt2" {
  subnet_id = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.public-rt
}