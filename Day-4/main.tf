provider"aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "var.ami_id "
  instance_type = "var.instance_type"
}

resource "aws_s3_bucket" "test_bucket" {
  bucket = "test_bucket"
  acl = "private"
}
 
resource "aws_dynamodb_table" "test_table" {
  name = "test_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "Lockid"

  attribute {
    name = "Lockid"
    type = "S"
  }
} 
 