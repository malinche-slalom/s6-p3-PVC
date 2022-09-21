resource "aws_instance" "jenkins_server_1" {
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  iam_instance_profile   = var.iam_role
  key_name               = "sprint6-cr-pvc-kp"
  subnet_id              = var.subnet_1
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "sprint6-cr-pvc-jenkins-1-tf"
  }
}

resource "null_resource" "jenkins_install_1" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./modules/jenkins-server/sprint6-cr-pvc-kp.pem")
    host        = aws_instance.jenkins_server_1.public_ip
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

  depends_on = [aws_instance.jenkins_server_1]
}

resource "aws_instance" "jenkins_server_2" {
  ami                    = "ami-05fa00d4c63e32376"
  instance_type          = "t2.micro"
  iam_instance_profile   = var.iam_role
  key_name               = "sprint6-cr-pvc-kp"
  subnet_id              = var.subnet_2
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = "sprint6-cr-pvc-jenkins-2-tf"
  }
}

resource "null_resource" "jenkins_install_2" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./modules/jenkins-server/sprint6-cr-pvc-kp.pem")
    host        = aws_instance.jenkins_server_2.public_ip
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

  depends_on = [aws_instance.jenkins_server_2]
}

