# provider "aws" {    
#     region = "us-east-1"
# }

# resource "aws_instance" "web" {
# #   count                  = 2
#   for_each = {
#       dev = "t2.micro",
#       prod = "t2.large"
#   }
#   ami                    = "ami-038f1ca1bd58a5790"
#   instance_type          = each.value
# #   instance_type          = "t2.micro"
# #   vpc_security_group_ids = [aws_security_group.sg_1.id]
# #   subnet_id              = aws_subnet.public_subnet_1.id
# #   key_name               = var.key_name

#   tags = {
#     # Name = "My_web ${count.index}"
#       Name = "My_web ${each.key}"
#   }
# }

# output "instance_ip" {

#     # value = aws_instance.web[*].public_ip
#     value = [for instance in aws_instance.web: instance.public_ip]

# }