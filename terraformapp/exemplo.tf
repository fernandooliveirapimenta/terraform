provider "aws" {
    access_key = "sdkjgksdjgksjgdj"
    secret_key = "skjgskjgksjkgjskjgksdjgkjs"
    region = "us-east-2"
}

resource "aws_instance" "teste_terraform" {
    ami = "ami-0d8f6eb4f641ef691"
    instance_type="t2.micro"
}

resource "aws_eip" "ip_publico" {
  instance = "${aws_instance.teste_terraform.id}"

}