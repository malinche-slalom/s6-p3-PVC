variable "launch_config" {
  description = "Name of the launch configuration"
  type = string
}

variable "tg_arn" {
  description = "Arn of the target group"
  type = string
}

variable subnet_1 {
  description = "Subnet 1 id"
  type = string
}

variable "subnet_2" {
  description = "Subnet 2 id"
  type = string
}