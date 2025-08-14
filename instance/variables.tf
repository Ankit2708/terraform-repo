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