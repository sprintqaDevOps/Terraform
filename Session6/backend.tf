terraform {
  backend "s3" {
    bucket = "terraform-state-files-zsalieva"
    key    = "tf-state/data-source.tfstate"
    region = "us-east-1"
  }
}