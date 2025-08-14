resource "aws_vpc" "myvpc" {
  cidr_block = var.vpc_cidr
}
resource "aws_subnet" "mypub-sub" {
  vpc_id     = [aws_vpc.myvpc.id]
  cidr_block = var.vpc_pub_cidr
  map_public_ip_on_launch = true
  tags = {
    Name = "pluto-pub-sub"
  }
}
resource "aws_subnet" "mypri-sub" {
  vpc_id = [aws_vpc.myvpc.id]
  cidr_block = var.vpc_pri_cidr
  tags = {
    Name = "pluto-pri-sub"
  }
}
resource "aws_internet_gateway" "myigw" {
  vpc_id = [aws_vpc.myvpc.id]
  tags = {
    Name = "myigw1"
  }
}
resource "aws_default_route_table" "my_route_table" {
  default_route_table_id = aws_vpc.myvpc.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}
resource "aws_route_table_association" "myrouteassociation" {
  route_table_id = aws_default_route_table.my_route_table.id
  subnet_id = aws_subnet.mypub-sub.id
}
resource "aws_security_group" "terrasg2" {
  vpc_id = aws_vpc.myvpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 80
    to_port = 80
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "myvpcterrainstance" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = [aws_security_group.terrasg2.id]
  subnet_id = aws_subnet.mypub-sub.id
  
}