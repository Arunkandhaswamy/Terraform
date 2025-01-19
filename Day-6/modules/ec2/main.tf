provider "aws" {
  region = "us-west-2"
}
resource "aws_vpc" "main" {
  cidr_block = "var.cidr"

    tags = {
        Name = "main"
    }
}

resource "aws_subnet" "subnet1"{

vpc_id= aws_vpc.main.id

cidr_block =" var.system_subnet_cidr"
}
resource "aws_instance" "example"{
    ami = "ami-0c55b159cbfafe1f0"
    instance_type = "t2.micro"
    sudnet_id = aws_subnet.subnet1.id
    }