# variable "create1" {
#   default = true
# }
# resource "random_pet" "pet1" {
#   count = var.create1 ? 1 : 0
#   length = 2
# }
# output "pet1" {
#   value = random_pet.pet1
# }

# variable "create2" {
#   default = false
# }
# resource "random_pet" "pet2" {
#   count = var.create2 ? 1 : 0
#   length = 2
# }
# output "pet2" {
#   value = random_pet.pet2
# }



#---------depending on environment name deciding to create t2.micro or t2.large--------


#provider "aws" {    
 #   region = "us-east-1"
#}

#variable "web_server_enabled" {
 # default = false
  
#}
#variable "environment" {

 # default = "prod"
  
#}

#resource "aws_instance" "web" {
  # count                  = var.web_server_enabled ? 1:0
 # ami                    = "ami-038f1ca1bd58a5790" 
  #instance_type          = var.environment == "dev" ? "t2.micro" : "t2.large"

#}





#----------------------------------------------------------
#  Creating 2 differetn types of ec2 in one shot

#provider "aws" {
#    region = "us-east-1"
#}
#resource "aws_instance" "web" {
 # for_each = {
  #    dev = "t2.micro",
   #   prod = "t2.large"
  #}
  #ami                    = "ami-038f1ca1bd58a5790"
  #instance_type          = each.value
  #tags = {
    # Name = "My_web ${count.index}"
   #   Name = "My_web ${each.key}"
  #}
#}
#