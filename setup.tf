provider "aws" {
  region     = "us-east-2"
}

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform"
  }
}

resource "aws_subnet" "tf-pub-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "tf-pub-subnet"
  }
}

resource "aws_subnet" "tf-pri-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "tf-pri-subnet"
  }
}
