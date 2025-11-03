terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
resource "aws_vpc_ipv4_cidr_block_association" "GodsCreation" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "GodssecondCreation" {
  vpc_id     = aws_vpc_ipv4_cidr_block_association.GodsCreation.vpc_id
  cidr_block = "10.0.1./24"
}



provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "AbrorIsDaGoat" {
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    name = "yay"
  }
}
