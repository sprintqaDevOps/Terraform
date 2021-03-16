terraform {
  backend "s3" {
    bucket = "terraform-state-files-mcalik"
    key    = "tfstate/data-source.tfstate"
    region = "us-east-1"
  }
}


