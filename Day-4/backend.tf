terraform {
    backend "s3" {
        bucket         = "my-tf-arun-test-bucket-1"
        key            = "terraform.tfstate"
        region         = "us-west-2"
        encrypt        = true
        dynamodb_table = "my-table"
    }
}