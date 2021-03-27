terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/session9.tfstate"
    region = "us-east-1"
  }
}