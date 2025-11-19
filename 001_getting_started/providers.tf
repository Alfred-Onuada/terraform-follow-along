terraform {
  backend "remote" {
    organization = "alfred-account"

    workspaces {
      name = "terraform-follow-along"
    }
  }

  required_version = "1.14.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}
