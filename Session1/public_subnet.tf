resource "aws_subnet" "public_subnet_1" {
  
  for_each = ["10.0.1.0/24","10.0.2.0/24"]

  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = each.value
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.prefix} public_subnet_1-${each.key}"
  }
}