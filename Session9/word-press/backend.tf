terraform {
  backend "s3" {
    bucket = "terraform-state-files-zsalieva"
    key    = "tf-state/wordpress.tfstate"
    region = "us-east-1"
  }
}