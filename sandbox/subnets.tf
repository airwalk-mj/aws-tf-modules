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

resource "aws_subnet" "public_subnet2" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.public_subnet2_cidr
  availability_zone = "us-east-1b"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Public Subnet 2"
  }
}

# Define the Private Subnets
resource "aws_subnet" "private_subnet1" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = "us-east-1a"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Private Subnet 1"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = "us-east-1b"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Private Subnet 2"
  }
}

# Define the Database Subnets
resource "aws_subnet" "private_database_subnet1" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.private_subnet1_cidr
  availability_zone = "us-east-1a"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Database Subnet 1"
  }
}

resource "aws_subnet" "private_database_subnet2" {
  vpc_id = aws_vpc.default.id
  cidr_block = var.private_subnet2_cidr
  availability_zone = "us-east-1b"
  depends_on = [aws_vpc.default]

  tags = {
    name = "Database Subnet 2"
  }
}

# Define the Database Subnet Group
resource "aws_db_subnet_group" "default" {
  name = "db-subnet-group"
  subnet_ids = [aws_subnet.private_database_subnet1.id, aws_subnet.private_database_subnet2.id]
  depends_on = [aws_subnet.private_database_subnet1, aws_subnet.private_database_subnet2]

  tags = {
    name = "Database Subnet Group"
  }
}