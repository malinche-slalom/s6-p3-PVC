variable "security_groups" {
  description = "Name of our security group"
  type = list(string)
}

variable "iam_role" {
  description = "Name of our Jenkins IAM role"
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