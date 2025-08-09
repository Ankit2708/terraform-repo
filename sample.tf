terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# terraform {
#   backend "s3" {
#     bucket = "terraformtestbucket112"
#     key = "terraform.tfstate"
#     region = "us-east-1"
#   }
# }
provider "aws" {
  region = var.region
}
resource "aws_instance" "myterraformtest" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids  = [aws_security_group.terra-sg1.id]
  tags = {
    Name = "instancefrontffile"
  }
}
resource "aws_security_group" "terra-sg1" {
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0" ]
  }
  egress {
    from_port = 0
    to_port   = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0" ]
  }
}
variable "ami" {
  default = "ami-020cba7c55df1f615"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "key_pair" {
  default = "linuxserver1key"
}
variable "vpc_security_group_ids" {
  default = ["sg-0b26b728e195aa341"]
}
variable "region" {
  default = "us-east-1"
}
output "public_ip" {
  value = aws_instance.myterraformtest.public_ip
}