provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami-id
  instance_type = var.instance-type
}

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}

resource "aws_dynamodb_table" "example" {
  name           = "my-table"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}