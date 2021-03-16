terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/webserver.tfstate"
    region = "us-east-1"
  }
}