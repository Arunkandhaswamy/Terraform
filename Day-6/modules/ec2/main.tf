provider "aws" {
  region = "us-west-2"
}
resource "aws_vpc" "main" {
  cidr_block = var.cidr

    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "subnet1"{

vpc_id= aws_vpc.main.id

cidr_block ="10.0.1.0/24"
}

resource "aws_instance" "example"{
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id   = aws_subnet.subnet1
    }