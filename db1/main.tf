provider "aws" {
  region = "us-east-1"
}
resource "aws_db_instance" "mydb" {
  instance_class = "db.t4g.micro"
  allocated_storage = 10
  engine = "mysql"
  engine_version = "8.0"
  db_name = "mydb123"
  username = "admin"
  password = "admin123"
  vpc_security_group_ids = ["sg-0b26b728e195aa341"]
  publicly_accessible = false
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot = true
}