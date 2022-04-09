resource "aws_iam_role" "users_iam_role" {
  name = "${var.ambiente}-register-iam-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_policy" "register_policy" {
  
  name = "${var.ambiente}-register-policy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:PutItem"
      ],
      "Effect": "Allow",
      "Sid": "",
      "Resource": "${aws_dynamodb_table.users.arn}"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "register_policy_attachment" {
  name = "${var.ambiente}-register-policy-attachment"
  roles      = [aws_iam_role.users_iam_role.name]
  policy_arn = aws_iam_policy.register_policy.arn
}