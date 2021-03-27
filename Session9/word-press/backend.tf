terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/wordpress.tfstate"
    region = "us-east-1"
  }
}