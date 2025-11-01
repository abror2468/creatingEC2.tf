terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "AbrorIsDaGoat" {
  ami = ami-0bdd88bd06d16ba03
  isntance_type = "t3.micro"
  tags = {
    name = "yay"
  }
}
