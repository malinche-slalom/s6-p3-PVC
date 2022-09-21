resource "aws_instance" "jenkins_server" {
  ami                  = "ami-05fa00d4c63e32376"
  instance_type        = "t2.micro"
  security_groups      = var.security_groups
  iam_instance_profile = var.iam_role
  key_name             = "sprint6-cr-pvc-kp"

  tags = {
    Name = "sprint6-cr-pvc-jenkins-tf"
  }
}

resource "null_resource" "name" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./modules/jenkins-server/sprint6-cr-pvc-kp.pem")
    host        = aws_instance.jenkins_server.public_ip
  }

  provisioner "file" {
    source      = "./modules/jenkins-server/userdata.sh"
    destination = "/tmp/userdata.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /tmp/userdata.sh",
      "sh /tmp/userdata.sh",
    ]
  }

  depends_on = [aws_instance.jenkins_server]
}

