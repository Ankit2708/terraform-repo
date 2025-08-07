terraform {
  backend "s3" {
    bucket = "terraformtestbucket112"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myterraformtest" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2.micro"
  key_name = "linuxserver1key"
  vpc_security_group_ids  = ["sg-0b26b728e195aa341"]
  tags = {
    Name = "instancefrontffile"
  }
}