resource "aws_dynamodb_table" "hello_world" {
    name = "${var.ambiente}-hello-world"
    hash_key = "id"
    billing_mode = "${var.billing_mode}"
    attribute {
        name = "id"
        type = "S"
    }
}