resource "aws_instance" "myterraformtest" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = var.vpc_security_group_ids
  tags = {
    Name = "instanceforterraformfile"
  }
}