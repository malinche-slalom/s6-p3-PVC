resource "aws_security_group" "ec2_sg" {
  name        = "sprint6-pvc-sg-tf"
  description = "Allow inbound traffic for EC2"

  ingress {
    description      = "SSH Access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["76.251.34.77/32","71.218.118.143/32","24.218.88.73/32","66.65.88.111/32","208.193.47.122/32"]
  }

  ingress {
    description      = "HTTP Port 80 Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["76.251.34.77/32","71.218.118.143/32","24.218.88.73/32","66.65.88.111/32","208.193.47.122/32"]
  }

  ingress {
    description      = "HTTP Port 8080 Access"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["76.251.34.77/32","71.218.118.143/32","24.218.88.73/32","66.65.88.111/32","208.193.47.122/32", "140.82.112.0/20", "143.55.64.0/20", "185.199.108.0/22", "192.30.252.0/22"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "sprint6-cr-pvc-sg-tf"
  }
}