terraform {
  required_version = "1.13.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.20.0"
    }
  }
}

# can be passed via CLI or tfvars file
variable "instance_type" {
  type = string
}

# this ones are harcorded and can't be passed in from CLI
locals {
  environment  = "Development"
  service_name = "MyServerInstance"
}

provider "aws" {
  profile = "terraform"
  region  = "eu-north-1"
}

resource "aws_instance" "my_server" {
  ami           = "ami-0c7d68785ec07306c"
  instance_type = var.instance_type

  tags = {
    Name        = local.service_name
    Environment = local.environment
  }
}

# this creates an output of name instance_ip_addr with value of the public IP of the created instance
output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}
