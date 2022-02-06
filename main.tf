# Mundos E

# provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.74.0"
    }
  }

  backend "s3" {
    bucket = "NO LO SE"
    key    = "tfstates/terraform.tfstate"
  }

}

provider "aws" {
  # Configuration options
  region = "us-east-2"
  
  access_key = "NO LO TENGO"
  secret_key = "NO LO TENGO"
}

# EC2 AMI
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "mundose" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.small"

  tags = {
    Name = "mundose"
  }
}


