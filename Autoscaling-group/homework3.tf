# Configure the AWS Provider
provider "aws" {
  region = var.region
}
resource "aws_vpc" "my_vpc" {
  cidr_block       = var.cidr_block_vpc 
  instance_tenancy = "default"
  tags = {
    Name = "my_vpc"
  }
  
  }
resource "aws_launch_template" "launch" {
  name                                  = "my_launch_template"
  image_id                              = var.ami 
  instance_initiated_shutdown_behavior  = "terminate"
  instance_type                         = var.instance_type
  key_name                              = var.key_name
  vpc_security_group_ids = [aws_security_group.sg_1.id]
  lifecycle {
    create_before_destroy = true
  }
}  
resource "aws_autoscaling_group" "bar" {
  name                      = "foobar3-terraform-test"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.subnet1.id]

launch_template {
    id = aws_launch_template.launch.id
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }

}
resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_block_subnet1
  map_public_ip_on_launch = true
   availability_zone= "us-east-1a"
  tags = {
    Name = "public_subnet1"
  }

}


resource "aws_key_pair" "tf_key" {
  key_name   = var.key_name
  public_key = file(var.ssh_key_path)
  }
resource "aws_security_group" "sg_1" {
  vpc_id      = aws_vpc.my_vpc.id
  ingress {
    description = "ssh from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "http from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
   }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_ssh_http"
  }

}