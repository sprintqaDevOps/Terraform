#vpc 
variable "cidr_block_vpc" {}
variable "prefix" {}
variable "cidr_block_subnet" {}  
variable "cidr_block_route" {}
#web-server module
variable "key_name" {}
variable "ssh_key_path" {}
variable "ami" {}
variable "instance_type" {}
variable "security_group_name" {}
variable "region" {}