# this creates an output of name instance_ip_addr with value of the public IP of the created instance
output "instance_ip_addr" {
  value = aws_instance.my_server.public_ip
}
