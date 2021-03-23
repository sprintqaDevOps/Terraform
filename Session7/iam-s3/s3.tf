resource "aws_s3_bucket" "b" {
  bucket = "mybucket-mcalik"
  acl    = "private"
  force_destroy = true
  tags = {
    Name = "mybucket-mcalik"
  }
}

