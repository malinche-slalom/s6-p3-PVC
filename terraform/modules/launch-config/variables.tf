variable "security_groups" {
  description = "Name of our security group"
  type = list(string)
}

variable "iam_role" {
  description = "Name of instance IAM role"
  type = string
}