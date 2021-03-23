terraform {
  backend "s3" {
    bucket = "terraform-state-files-zsalieva"
    key    = "tf-state/vpc-module.tfstate"
    region = "us-east-1"
  }
}