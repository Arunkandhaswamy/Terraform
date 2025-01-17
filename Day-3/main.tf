
resource "aws_instance" "arun_kumar" {
  ami           = var.ami_id
  instance_type = var.instance_type
}