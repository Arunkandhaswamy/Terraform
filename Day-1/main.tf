provider "aws" {
    region = "us-west-2"

}
resource "aws_instance" "example2" {
    ami           = "ami-00c257e12d6828491" # Replace with a valid AMI ID for your region
    instance_type = "t2.micro"
    subnet_id = "subnet-07cdcffa512cb5d5d"
    tags = {
        Name = "example-instance2"
    }
}