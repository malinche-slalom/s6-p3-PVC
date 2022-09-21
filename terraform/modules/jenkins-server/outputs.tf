output "jenkins_1_url" {
  value = join("", ["http://", aws_instance.jenkins_server_1.public_dns, ":", "8080"])
}

output "jenkins_2_url" {
  value = join("", ["http://", aws_instance.jenkins_server_2.public_dns, ":", "8080"])
}