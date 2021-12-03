
provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = "${var.bucket_stage}-${var.ambiente}"
  acl    = "private"

  tags = {
    Environment = var.ambiente
    Outra = "hardcode"
  }
}