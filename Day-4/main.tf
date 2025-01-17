provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami-id
  instance_type = var.instance-type

  tags = {
    Name = "can-terraform"
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-arun-test-bucket-1"
  acl    = "private"
}

resource "aws_dynamodb_table" "example" {
  name           = "my-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}