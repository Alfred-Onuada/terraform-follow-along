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

# modules allow you to create multiple things all at once from a short snippet
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
