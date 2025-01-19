provider "aws" {
  region = "us-west-2"
}

variable "cidr" {
  default = "10.0.0.0/16"
}


resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr
}

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_key_pair" "my_key" {
  key_name = "mykey"
  public_key = file("/home/arun_k/.ssh/id_rsa.pub")
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}

resource "aws_route_table_association" "my_subnet_association" {
  subnet_id = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}

resource "aws_security_group" "my_sg" {
name      = "web"
vpc_id = aws_vpc.my_vpc.id

ingress {
    description = "Allow HTTP from VPC"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
ingress {
  description = "Allow SSH from VPC"
  from_port = 22
  to_port = 22
  protocol = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

egress {
    description = "Allow all traffic to VPC"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web"
  }
}

resource "aws_instance" "ec2_arun" {
    ami                    = "ami-00c257e12d6828491" # Replace with a valid AMI ID
    instance_type          = "t2.micro" # Replace with your desired instance type
    key_name               = aws_key_pair.my_key.key_name 
    subnet_id              = aws_subnet.my_subnet.id
    vpc_security_group_ids = [aws_security_group.my_sg.id]


  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("/home/arun_k/.ssh/id_rsa")
    host        = self.public_ip
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
}
