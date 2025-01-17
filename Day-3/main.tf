provider "aws"{

region = " us-west-2"
}

module "ec2-instances"{
  source = "./modules/ec2-instances"
  ami_id = "ami-00c257e12d6828491"
  instance_type = "t2.micro"
}
