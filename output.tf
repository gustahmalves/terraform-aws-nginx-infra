output "aws_vpc_id" {
  value = aws_vpc.my_vpc.id

}

output "instance_public_ip" {
  value = aws_instance.ec2_nginx.public_ip

}