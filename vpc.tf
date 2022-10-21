#Creation of VPC
resource "aws_vpc" "my_vpc" { 
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}

#Creation of 2 Public subnets with count function
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
  count = 2
  tags = {
    Name = "public_subnet ${count.index}"
  }
}

#Creation of 2 Private subnets with count function
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.2.0/24"
  count = 2
  tags = {
    Name = "private_subnet ${count.index}"
  }
}