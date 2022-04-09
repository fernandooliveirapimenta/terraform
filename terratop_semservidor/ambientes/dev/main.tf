module "users" {
  source = "../../infra/modulo-tf-users"
  ambiente = "${var.ambiente}"
  read_capacity = "1"
  write_capacity = "1"
}