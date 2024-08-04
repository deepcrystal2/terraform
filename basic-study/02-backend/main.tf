provider "aws" {
  region = "ap-northeast-2"
}

terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "deepcrystal2-terraform"

    workspaces {
      name = "tf-cloud-backend"
    }
  }
}

resource "aws_vpc" "test" {
  cidr_block       = "10.0.0.0/16"

  tags = {
    Name = "terraform-test"
  }
}

