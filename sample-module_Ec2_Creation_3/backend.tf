terraform {
  backend "s3" {
    bucket = "terraform-state-files-zsalieva"
    key    = "tf-state/module.tfstate"
    region = "us-east-1"
  }
}