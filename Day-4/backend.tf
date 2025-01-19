terraform {
  backend "s3" {
    bucket = "arun-demo-test-bucket-1"
    key    = "terraform.tfstate"
    region = "us-west-2"
  }
  aws_dynamodb_table = "test_table"
  
}
