variable "cidr" {   
  type        = string 
}

variable "instance_type" {
  description = "The type of instance to start"
  } 

variable "ami_id" { 
description = "The AMI ID to use for the instance"
  }     