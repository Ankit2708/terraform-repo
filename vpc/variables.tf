variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "vpc_pub_cidr" {
  default = "10.0.1.0/24"
}
variable "vpc_pri_cidr" {
  default = "10.0.2.0/24"
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