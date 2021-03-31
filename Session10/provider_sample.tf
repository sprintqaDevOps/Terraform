provider "aws" {    
    region = "us-east-1"
}

provider "aws" {    
    alias = "west"      #will help you create in different regions same ec2 type
    region = "us-west-1"
}

resource "aws_instance" "web-east" {

  ami                    = "ami-038f1ca1bd58a5790"
  instance_type          = "t2.micro"

  tags = {
      Name = "My_web east"
  }
}

resource "aws_instance" "web-west" {
  provider       = aws.west
  ami            = "ami-0a245a00f741d6301"
  instance_type  = "t2.micro"

  tags = {
      Name = "My_web west"
  }
}