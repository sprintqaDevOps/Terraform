resource "aws_key_pair" "mykeypair2" {
  key_name   = "mykeypair2"
  public_key = file("~/.ssh/id_rsa.pub")
  lifecycle {
    ignore_changes = [public_key]
  }
}
