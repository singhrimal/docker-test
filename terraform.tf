terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  profile = " "
}



/*backend "remote" {
    hostname     = "app.terraform.io"
    organization = "supertech"
    workspaces {
      name = "aws-work"
    }

  }*/
