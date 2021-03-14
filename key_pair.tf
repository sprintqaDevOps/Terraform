resource "aws_key_pair" "my_macbook_key" {
  key_name   = "my_macbook_key"
  public_key = file("~/.ssh/id_rsa.pub")
}