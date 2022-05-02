resource "aws_iam_role" "login_iam_role" {
  name = "${var.ambiente}-login-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_iam_policy" "login_policy" {
  
  name = "${var.ambiente}-login-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action = "dynamodb:Query"
    resource = "${aws_dynamodb_table.users.arn}/index/*"
  })
}

resource "aws_iam_policy_attachment" "login_policy_attachment" {
  name = "${var.ambiente}-login-policy-attachment"
  roles      = [aws_iam_role.login_iam_role.name]
  policy_arn = aws_iam_policy.login_policy.arn
}


resource "aws_ssm_parameter" "login_iam_role" {
  name = "${var.ambiente}-login-iam-role"
  type = "String"
  value = "${aws_iam_role.login_iam_role.arn}"
}