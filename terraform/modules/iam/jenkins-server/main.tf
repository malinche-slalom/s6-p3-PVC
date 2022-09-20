resource "aws_iam_role" "jenkins_server_role" {
  name = "sprint6-cr-pvc-jenkins-server-role"

  assume_role_policy = file("./modules/iam/jenkins-server/assume_role_policy.json")
}

resource "aws_iam_instance_profile" "jenkins_instance_profile" {
  name = "sprint6-cr-pvc-jenkins-server-profile"
  role = aws_iam_role.jenkins_server_role.name
}

resource "aws_iam_role_policy" "jenkins_server_policy" {
  name = "sprint6-cr-pvc-jenkins-server-policy"
  role = aws_iam_role.jenkins_server_role.id

  policy = file("./modules/iam/jenkins-server/policy.json")
}