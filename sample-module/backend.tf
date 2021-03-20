terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/sample-module.tfstate"
    region = "us-east-1"
  }
}