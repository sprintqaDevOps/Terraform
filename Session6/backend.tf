terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/session6.tfstate"
    region = "us-east-1"
  }
}