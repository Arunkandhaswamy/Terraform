resource "aws-ec2-instance" "arun-demo-test-instance-1" {
  ami = var.ami_id
  instance_type = var.my_instance_type
  
}



resource "aws_s3_bucket" "arun-demo-test-bucket-1" {
  bucket = "arun-demo-test-bucket-1"
  acl    = "private"
}

resource "aws_dynamodb_table" "test_table" {
  name         = "test_table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
 