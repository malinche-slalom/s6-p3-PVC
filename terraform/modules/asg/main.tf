resource "aws_autoscaling_group" "bar" {
  name                 = "sprint6-cr-pvc-asg-tf"
  availability_zones = ["us-east-1a"]
  launch_configuration = var.launch_config
  min_size             = 1
  max_size             = 3

  lifecycle {
    create_before_destroy = true
  }
}