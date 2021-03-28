provider "aws" {
   region = "us-east-1"
}
resource "aws_vpc" "my_vpc" {

  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }

}

# 
variable "cidr_block_public" {

  default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  
}

variable "cidr_block_private" {

  default = ["10.0.4.0/24", "10.0.5.0/24"]
  
}

