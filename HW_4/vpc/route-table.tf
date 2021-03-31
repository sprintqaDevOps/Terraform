resource "aws_route_table" "r" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = var.cidr_block_route
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "${var.prefix}-route_table"
  }
}
resource "aws_route_table_association" "route_associate-1" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.r.id
}