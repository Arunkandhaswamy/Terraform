variable "ami_id" {
    description = "The AMI ID to use for the instance"
    type = string
}
variable "instance_type" {
    description = "The type of instance to launch"
    type = string
}



provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "arun_kumar" {
  ami           = "var.ami_id"
  instance_type = "var.instance_type"
}