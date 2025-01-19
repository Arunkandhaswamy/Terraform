provider"aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami = "var.ami_id "
  instance_type = "var.instance_type"
}

resource "aws_s3_bucket" "test bucket" {
  bucket = "test bucket"
  acl = "private"
}
 
resource 'aws_mangodb_table' 'test_table' {
  name = 'test_table'
  billing_mode = 'Pay_per_request'
  hash_key = 'Lockid'

  attribute {
    name = 'Lockid'
    type = 'S'
  }
} 
 