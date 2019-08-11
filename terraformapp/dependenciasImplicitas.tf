provider "aws" {
    access_key = "salkgjkdsjgk"    
    secret_key = "salkgjkdsjgk"    
    region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_bucket" {
    bucket = "br.com.terrabucket"
    acl = "private"
  
}

resource "aws_eip" "ip_publico" {
    instance = "${instance.terraform_bucket.id}"
}

resource "aws_instance" "teste_terraform" {
    ami = "skgksdgksdjgk" 
    instance_type = "t2.micro"
    depends_on = ["aws_s3_bucket.terraform_bucket"]
}





