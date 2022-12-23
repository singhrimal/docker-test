terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = "default"
}


# Code for remote backend, AWS S3 bucket

/*backend "remote" {
    hostname     = "app.terraform.io"
    organization = ""
    workspaces {
      name = " "
    }

  }*/
