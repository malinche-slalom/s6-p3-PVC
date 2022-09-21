resource "aws_launch_configuration" "asg_launch_configuration" {
  name_prefix          = "sprint6-cr-pvc-launch-config-tf-"
  image_id             = "ami-05fa00d4c63e32376"
  instance_type        = "t2.micro"
  security_groups      = var.security_groups
  iam_instance_profile = var.iam_role
  key_name             = "sprint6-cr-pvc-kp"
  user_data            = file("./modules/launch-config/userdata.sh")

  lifecycle {
    create_before_destroy = true
  }
}