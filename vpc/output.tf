output "pub-sub_id" {
  value = aws_subnet.mypub-sub.id
}
output "pri-sub_id" {
  value = aws_subnet.mypri-sub.id
}
output "myvpcid" {
  value = aws_vpc.myvpc.id
}