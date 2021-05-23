provider "aws" {
  region     = "us-east-2"
}

/*==== VPC ======*/

resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "terraform"
  }
}

/*==== Subnets ======*/

resource "aws_subnet" "tf-pub-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "tf-pub-subnet"
  }
}

resource "aws_subnet" "tf-pri-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.2.0/24"
  tags = {
    Name = "tf-pri-subnet"
  }
}
/*==== Security Groups ======*/
resource "aws_security_group" "Public" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

/*==== Route Table ======*/

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name        = "Public-RT"
  }
}
resource "aws_route_table_association" "public" {
  count          = "1"
  subnet_id      = aws_subnet.tf-pub-subnet.id
  route_table_id = aws_route_table.public.id
}

/*==== Instance ======*/
resource "aws_instance" "server" {
  subnet_id     = aws_subnet.tf-pub-subnet.id
  vpc_security_group_ids  = aws_security_group.Public.id
  ami           = "i-0063a0a0beb35acdd"
  instance_type = "t2.micro"
}
