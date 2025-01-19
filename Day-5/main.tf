variable "cidr" {
  default = "10.0.0.0/16"
}


resource "vpc" "my_vpc" {
  cidr_block = "var.cidr"
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = "vpc.my_vpc.id"
  cidr_block = "10.0.1.0/24"
}

resource"aws_key_pair" "my_key" {
  key_name = "mykey"
  public_key = file("mykey.pub")
}

resource"aws_interent_gateway" "my_igw" {
  vpc_id = "vpc.my_vpc.id"
}

resource 'aws_route_table' 'my_route_table' {
  vpc_id = "vpc.my_vpc.id"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "aws_internet_gateway.my_igw.id"
    }
}

resource "aws_security_group" "my_sg"{
name = "web"
vpc_id=aws_vpc.my_vpc.id

ingress {
description = "Allow HTTP from VPC"
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"] 
}
ingress{
description = "Allow SSH from VPC"
from_port = 22
to_port = 22
protocol = "tcp"    
cidr_blocks = ["0.0.0.0/0"]
}
egress  {   

description = "Allow all traffic to VPC"
from_port = 0
to_port =   0 
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}    
      tags = {
        Name = "web"
      }
}

resource "aws_instance""ec2_arun"{
ami           = var.my_ami
instance_type = var.my_instance
vpc.aws_security_group = aws.aws_security_group.my_sg.id
}

connection {
type = "ssh"
}

provisioner "file" {
source      = "app.py"  # Replace with the path to your local file
destination = "/home/ubuntu/app.py"  # Replace with the path on the remote instance
}

provisioner "remote-exec" {
    inline = [
      "echo 'Hello from the remote instance'",
      "sudo apt update -y",  # Update package lists (for ubuntu)
      "sudo apt-get install -y python3-pip",  # Example package installation
      "cd /home/ubuntu",
      "sudo pip3 install flask",
      "sudo python3 app.py &",
    ]
}