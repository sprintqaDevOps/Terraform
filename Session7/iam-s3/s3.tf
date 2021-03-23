resource "aws_s3_bucket" "b" {
  bucket = "mybucket-zukhra"
  acl    = "private"
  force_destroy = true
  tags = {
    Name = "mybucket-zukhra"
  }
}