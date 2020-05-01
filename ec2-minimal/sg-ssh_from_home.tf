
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh_from_home"
  description = "allow ssh from home"
  vpc_id      = aws_vpc.default.id

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [
      aws_vpc.default.cidr_block,
      var.my_ip
    ]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_from_home"
  }
}