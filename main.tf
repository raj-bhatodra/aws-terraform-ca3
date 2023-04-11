terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

variable "test" {
  type = string
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}


resource "aws_instance" "app_server" {
  ami           = "ami-07d3a50bd29811cd1"
  instance_type = var.test

  tags = {
    Name = "tf-test"
  }
}

output "instance_ip_addr" {
  value = aws_instance.app_server.public_ip
}

resource "aws_s3_bucket" "b" {
  bucket = "raj-s3-bucket-test14"

  tags = {
    Name        = "My-bucket"
    Environment = "Dev"
  }
}