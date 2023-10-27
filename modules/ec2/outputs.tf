output "private_ip" {
  value = aws_instance.tf_instance[*].private_ip
}

output "public_ip" {
  value = aws_instance.tf_instance[*].public_ip
}