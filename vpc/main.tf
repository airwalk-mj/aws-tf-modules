# Define the VPC
resource "aws_apc" "default" {
  cidr_clock = var.vpc_cidr
  enable_dns_hostnames = true

  tags {
    name = "DevOps POC VPC"
  }
}