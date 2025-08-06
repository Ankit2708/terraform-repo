provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "myterraformtest" {
  ami = "ami-020cba7c55df1f615"
  instance_type = "t2-micro"
  key_name = "linuxserver1key.pem"
  security_groups = ["sg-0b26b728e195aa341"]
}