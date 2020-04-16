# Define the VPC
resource "aws_lambda" "default" {

}

# Define the Public Subnets
resource "aws_subnet" "public_subnet1" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.public_subnet1_cidr
  availability_zone = "us-east-1a"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Public Subnet 1"
  }
}