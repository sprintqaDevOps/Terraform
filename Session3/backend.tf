terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/session3.tfstate"
    region = "us-east-1"
  }
}


