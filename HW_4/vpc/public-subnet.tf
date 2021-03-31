resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.cidr_block_subnet
  map_public_ip_on_launch = true

 tags = {
    Name = "${var.prefix}-subnet"
  }
}
# resource "aws_subnet" "main-public-1" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.1.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "us-east-1a"
#   tags = {
#     Name = "main-public-1"
#   }
# }
# resource "aws_subnet" "main-public-2" {
#   vpc_id                  = aws_vpc.my_vpc.id
#   cidr_block              = "10.0.2.0/24"
#   map_public_ip_on_launch = "true"
#   availability_zone       = "us-east-1b"
#   tags = {
#     Name = "main-public-2"
#   }
# }