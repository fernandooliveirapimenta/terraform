module "dev" {
  source = "../../infra/modulo-hello"
  ambiente = "${var.ambiente}"
  billing_mode = "PAY_PER_REQUEST"
}