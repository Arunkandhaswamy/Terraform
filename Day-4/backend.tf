terraform {
  backend "s3" {
     bucket= "arun-demo-test-bucket-1"
     region = "us-west-2"
     key = "terraform.tfstate"
     aws_dynamodb_table = "test_table"
  }


}
