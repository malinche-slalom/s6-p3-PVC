resource "aws_instance" "jenkins_server" {
  ami             = "ami-05fa00d4c63e32376"
  instance_type   = "t2.micro"
  security_groups = var.security_groups

  tags = {
    Name = "sprint6-cr-pvc-jenkins-tf"
  }
}