provider "aws" {
    access_key = "salkgjkdsjgk"    
    secret_key = "salkgjkdsjgk"    
    region = "us-east-2"
}

resource "aws_s3_bucket" "terraform_bucket" {
    bucket = "br.com.terrabucket"
    acl = "private"
}

resource "aws_key_pair" "keyMacFernando" {
    key_name = "keyMacFernando"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQChdYXYET+hPDHMYfwQhT9E4XCj04uQh9CyjMReibS5tip8UkSghVMA3C2lzhArfgQdrJQbDrO1DGC39Qccbzf1mnbvpY4N6KTWffJVbWMZlSG0ta6QBWXYShyL953xBKyFItTw1pzBT57pcGXaZUEj0JFjaGLsc3aKBESY3P1AnTYLiwNohm0Vfy2okwFu4lXiyPLvzEAsJJGX8Fjbd/WrwRG53wBax5uqOUpFp5x40Qux69BY+CD/p4ao6jxdm4Jm0lj1XadoZpGMESlWfCK5AwFJ7IxiK2OmCbeWrh7CALG+IY1WROoMW7cTsAdo07TMoNQbJK5mPpnGzVbuB0ql3e+1oSGcbXlqjb6edIP7vw8m4PkaM89fjvjwVY0bcMhdOe4o59pC1sq8WVFLvj0W3RuXNoCnWoWDQXmOiPRst5DXWEvPqDFQkFXBLcHGE9mfWvz3cef6O3vZHpJh27OJzSUWIw37DvSLnNnwOHyqWI82HjiPixX8Ge3b7k59bDwypPBLI6w4AIXWvoVakDq3/qSWAvCIHPSDNENLZmDTNzeasuXxY9gTAbO6UeS2YCY90VHA70Ro8blAFBFwF0vw6gxC3nGuaP4h46YzDfA2JHoQsbq3txFUwGfctIf6ckG18SsSyXUZjBK3iqFkc2sC+sHzvBCn6Xug9Wt+L4lqbQ== fernando.pimenta107@gmail.com"
}

resource "aws_eip" "ip_publico" {
    instance = "${instance.terraform_bucket.id}"
}

resource "aws_security_group" "sg" {
  name        = "sg"

  ingress{
    from_port   = -1
    to_port     = 22
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = "-1"
      to_port = 80
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "teste_terraform" {
    ami = "skgksdgksdjgk" 
    instance_type = "t2.micro"
    depends_on = ["aws_s3_bucket.terraform_bucket"]
    key_name = "${aws_key_pair.keyMacFernando}"
    security_groups = "${aws_security_group.sg.name}"

    provisioner "file" {
        source = "install_nginx"
        destination = "/tmp/install_nginx.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chmod +x /tmp/install_nginx.sh",
            "/tmp/install_nginx.sh",
        ]
        connection {
            type = "ssh"
            user = "ubuntu"
            password = "${file("~/.shh/private")}"
            agent = "false"
        }
    }
}
