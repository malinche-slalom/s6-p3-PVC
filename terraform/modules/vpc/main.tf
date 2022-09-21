resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "sprint6-cr-pvc-vpc-tf"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "sprint6-cr-pvc-internet-gateway-tf"
  }
}

resource "aws_subnet" "subnet_1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sprint6-cr-pvc-subnet-1-tf"
  }
}

resource "aws_subnet" "subnet_2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sprint6-cr-pvc-subnet-2-tf"
  }
}