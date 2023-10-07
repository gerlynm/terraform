output "jenkins_instance_ip" {
  value = aws_instance.jenkins_instance.public_ip
}

output "sonarqube_instance_ip" {
  value = aws_instance.sonarqube_instance.public_ip
}