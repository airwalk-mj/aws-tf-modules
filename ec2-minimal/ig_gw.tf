# Define the Internet gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
  depends_on = [aws_vpc.default]

  tags = {
    name = "DevOps POC VPC"
  }
}