resource "aws_autoscaling_group" "autoscaling_group" {
  name                 = "sprint6-cr-pvc-asg-tf"
  vpc_zone_identifier = [var.subnet_1, var.subnet_2]
  launch_configuration = var.launch_config
  min_size             = 1
  max_size             = 3
  target_group_arns    = [var.tg_arn]

  lifecycle {
    create_before_destroy = true
  }
}