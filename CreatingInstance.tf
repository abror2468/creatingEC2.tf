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
  access_key = "AKIAWMTIC5DUIOISFJOD"
  secret_key = "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"
}

resource "aws_instance" "AbrorIsDaGoat" {
  ami = "ami-0bdd88bd06d16ba03"
  isstance_type = "t3.micro"
  tags = {
    name = "yay"
  }
}
