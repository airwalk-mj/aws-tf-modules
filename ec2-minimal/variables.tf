
variable "my_ip" {
  description = "CIDR of the remote admin"
  default = "90.240.30.168/32"   # Change this to the public ip of your ISP
}

variable "remote_cidr" {
  description = "CIDR of the remote admin"
  default = "90.240.30.168/32"   # Change this to the public ip of your ISP
}

variable "vpc_cidr" {
  description = "CIDR of the whole VPC"
  default = "10.0.0.0/16"
}

variable "public_subnet1_cidr" {
  description = "CIDR for Public Subnet 1"
  default = "10.0.0.0/25"
}

variable "public_subnet2_cidr" {
  description = "CIDR for Public Subnet 2"
  default = "10.0.0.128/25"
}

variable "private_subnet1_cidr" {
  description = "CIDR for Private Subnet 1"
  default = "10.0.2.0/25"
}

variable "private_subnet2_cidr" {
  description = "CIDR for Private Subnet 2"
  default = "10.0.2.128/25"
}

variable "database_subnet1_cidr" {
  description = "CIDR for Private Subnet 1"
  default = "10.0.4.0/25"
}

variable "database_subnet2_cidr" {
  description = "CIDR for Private Subnet 2"
  default = "10.0.4.128/25"
}

#variable "key_path" {
#  description = "SSH Public Key Path"
#  default = "/Users/mark/.ssh/id_rsa.pub"    # Change this to a valid ssh key pair on your 
#}