terraform {
  required_version = "1.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}

provider "aws" {
  profile = "terraform"
  region  = "eu-north-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0c7d68785ec07306c"
  instance_type = "t3.micro"

  tags = {
    Name = "MyServerInstance"
  }
}
