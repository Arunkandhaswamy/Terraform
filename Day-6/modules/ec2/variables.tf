variable "cidr" {   
  type        = string
  default     = "10.0.0.0/16"  
}




variable "instance_type" {
  default = "t2.micro"
  } 

variable "aws-ami" {
  default = "ami-0c55b159cbfafe1f0"
  }    