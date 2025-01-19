provider "aws" {
    region = "us-west-2"
}

module "ec2" {
    source = "./modules/ec2"
  subnet_id= aws_subnet.default.id
    instance_type = "t3.micro"

    tags = {
        Name = "ec2-instance2"
    }
}