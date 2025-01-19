provider "aws" {
    region = "us-west-2"
}

module "ec2" {
    source = "./modules/ec2"
    aws_subnet_id = aws_subnet.default.id
    aws_instance_type = "t3.micro"

    tags = {
        Name = "ec2-instance2"
    }
}