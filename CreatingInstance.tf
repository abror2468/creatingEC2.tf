terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}


resource "aws_subnet" "GodssecondCreation" {
  vpc_id     = aws_vpc.AMEN.id
  cidr_block = "10.0.0.16/28"
}

resource "aws_vpc" "AMEN" {
  cidr_block = "10.0.0.0/16"
}

provider "aws" {
  region = "us-east-1"
}



resource "aws_instance" "AbrorIsDaGoat" {
  subnet_id = aws_subnet.GodssecondCreation.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  ami = "ami-0bdd88bd06d16ba03"
  instance_type = "t3.micro"
  tags = {
    name = "yay"
  }
}







resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_vpc.AMEN.id

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}



resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

