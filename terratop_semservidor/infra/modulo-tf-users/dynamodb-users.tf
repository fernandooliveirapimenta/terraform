resource "aws_dynamodb_table" "users" {
    name = "${var.ambiente}-users"
    hash_key = "id"
    attribute {
      name = "id"
      type = "S"
    }
    attribute {
      name = "email"
      type = "S"
    }
    global_secondary_index {
      name = "${var.ambiente}-email-gsi"
      projection_type = "ALL"
      hash_key = "email"
      write_capacity = "${var.write_capacity}"
      read_capacity = "${var.read_capacity}"
    }
    write_capacity = "${var.write_capacity}"
    read_capacity = "${var.read_capacity}"
}

resource "aws_ssm_parameter" "dynamodb_users_table" {

    name = "${var.ambiente}-dynamodb-users-table"
    type = "String"
    value = "${aws_dynamodb_table.users.name}"
  
}

resource "aws_ssm_parameter" "email_gsi" {

    name = "${var.ambiente}-email-gsi"
    type = "String"
    value = "${var.ambiente}-email-gsi"
  
}