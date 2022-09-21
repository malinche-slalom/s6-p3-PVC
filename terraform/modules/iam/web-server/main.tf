resource "aws_iam_role" "web_server_role" {
  name = "sprint6-cr-pvc-web-server-role"

  assume_role_policy = file("./modules/iam/web-server/assume_role_policy.json")
}

resource "aws_iam_instance_profile" "web_server_instance_profile" {
  name = "sprint6-cr-pvc-web-server-profile"
  role = aws_iam_role.web_server_role.name
}
resource "aws_iam_role_policy" "web_server_policy" {
  name = "sprint6-cr-pvc-web-server-policy"
  role = aws_iam_role.web_server_role.id

  policy = file("./modules/iam/web-server/policy.json")
}