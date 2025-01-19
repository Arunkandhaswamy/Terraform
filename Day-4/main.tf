provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.my_instance_type
}

resource "s3" "example" {
  bucket = "my-tf-test-bucket"
  acl    = "private"
}

resource "aws_dynambodb_table" "example" {
  name           = "my-table"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}