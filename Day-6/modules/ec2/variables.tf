variable "cidr" {   
  type        = string
  default     = "10.0.0.0/16"  
}


variable "subnet1"   {
  cidr_block= "10.0.1.0/24"
  }

variable "instance_type" {
  default = "t2.micro"
  } 

variable "aws-ami" {
  default = "ami-0c55b159cbfafe1f0"
  }    