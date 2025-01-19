variable "cidr" {   
  type        = string
  default     = "10.0.0.0/16"  
}




variable "instance_type" {
  default = "t2.micro"
  } 

variable "ami_id" { 
  default = "ami-00c257e12d682849"
  }     