# terraform {
#   backend "s3" {
#     bucket = "terraformtestbucket112"
#     key = "terraform.tfstate"
#     region = "us-east-1"
#   }
# }
provider "aws" {
  region = "us-east-1"
}
module "myinstance" {
  source = "./instance"
}
module "myvpc" {
  source = "./vpc"
}
# resource "aws_instance" "myterraformtest" {
#   ami = var.ami
#   instance_type = var.instance_type
#   key_name = var.key_pair
#   vpc_security_group_ids  = [data.aws_security_group.mysg.id]
#   tags = {
#     Name = "instancefrontffile"
#   }
# }
# resource "aws_security_group" "terra-sg1" {
#   vpc_id = aws_vpc.myvpc.id
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0" ]
#   }
#   egress {
#     from_port = 0
#     to_port   = 0
#     protocol = -1
#     cidr_blocks = ["0.0.0.0/0" ]
#   }
# }
# data "aws_security_group" "mysg" {
#   filter {
#     name = "vpc-id"
#     values = ["vpc-03411d629d3b8dc24"]
#   }
#   filter {
#     name = "group-name"
#     values = ["launch-wizard-1"]
#   }
# }
# resource "aws_vpc" "myvpc" {
#   cidr_block = "10.0.0.0/16"
# }
# resource "aws_subnet" "mysub-pub" {
#   vpc_id = aws_vpc.myvpc.id
#   cidr_block = "10.0.1.0/24"
#   map_public_ip_on_launch = true
#   tags = {
#     Name = "pluto-pub-sub"
#   }
# }
# resource "aws_subnet" "mysub-pvt" {
#   vpc_id = aws_vpc.myvpc.id
#   cidr_block = "10.0.2.0/24"
#   tags = {
#     Name = "pluto-pvt-sub"
#   }
# }
# resource "aws_internet_gateway" "myigw" {
#   vpc_id = aws_vpc.myvpc.id
#   tags = {
#     Name = "pluto-pub-sub"
#   }
# }
# resource "aws_route_table" "myroute_table" {
#   vpc_id = aws_vpc.myvpc.id
#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.myigw.id
#   }
# }
# resource "aws_route_table_association" "myrouteassocoiation" {
#   subnet_id = aws_subnet.mysub-pub.id
#   route_table_id = aws_route_table.myroute_table.id
# }
# resource "aws_instance" "vpc1instance" {
#   ami = var.ami
#   instance_type = var.instance_type
#   key_name = var.key_pair
#   subnet_id = aws_subnet.mysub-pub.id
#   vpc_security_group_ids  = [aws_security_group.terra-sg1.id]
# }
