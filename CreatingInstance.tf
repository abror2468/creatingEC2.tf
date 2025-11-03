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

resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}
resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  subnets            = GodssecondCreation.id

  enable_deletion_protection = true

  access_logs {
    bucket  = aws_s3_bucket.lb_logs.id
    prefix  = "test-lb"
    enabled = true
  }

  tags = {
    Environment = "production"
  }
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
