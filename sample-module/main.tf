provider "aws" {
  region = var.region
}

module "myapp-vpc" {
    source = "./vpc"
}

module "myapp-webserver" {
    source = "./web-server"
}