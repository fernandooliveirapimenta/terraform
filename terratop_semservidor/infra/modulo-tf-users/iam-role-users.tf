resource "aws_iam_role" "users_iam_role" {
  name = "${var.ambiente}-register-iam-role"
  assume_role_policy = templatefile("${path.module}/templates/lambda-base-policy.tpl", {})
}

resource "aws_iam_policy" "register_policy" {
  
  name = "${var.ambiente}-register-policy"
  policy = templatefile("${path.module}/templates/dynamodb-policy.tpl", {
    action = "dynamodb:PutItem"
    resource = "${aws_dynamodb_table.users.arn}"
  })
}

resource "aws_iam_policy_attachment" "register_policy_attachment" {
  name = "${var.ambiente}-register-policy-attachment"
  roles      = [aws_iam_role.users_iam_role.name]
  policy_arn = aws_iam_policy.register_policy.arn
}


resource "aws_ssm_parameter" "register_iam_role" {
  name = "${var.ambiente}-register-iam-role"
  type = "String"
  value = "${aws_iam_role.users_iam_role.arn}"
}