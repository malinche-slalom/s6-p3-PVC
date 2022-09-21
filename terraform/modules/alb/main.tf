resource "aws_lb" "load_balancer" {
  name               = "sprint6-cr-pvc-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = var.security_groups
  subnets = [var.subnet_1, var.subnet_2]
}

resource "aws_lb_target_group" "tg" {
  name     = "sprint6-cr-pvc-lb-tg-tf"
  port     = 8080
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.tg.arn
  }
}