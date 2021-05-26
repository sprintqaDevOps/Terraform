provider "aws" {
    region = var.region
  
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
 
  }
}
module "Terraform_ec2" {
  source = "./web-server"
 # source = "github.com/sprintqaDevOps/web-server.git"
  key_name     =var.key_name
  ssh_key_path =var.ssh_key_path
  ami          = var.ami
  instance_type = var.instance_type
  vpc_id        = aws_default_vpc.default.id
  security_group_name= var.security_group_name
  

}