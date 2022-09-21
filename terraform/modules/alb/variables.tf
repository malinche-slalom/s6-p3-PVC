variable "security_groups" {
  description = "Name of our security group"
  type = list(string)
}

variable "target_id" {
  description = "Target ID"
  type = string
}

variable "vpc_id" {
  description = "VPC ID"
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