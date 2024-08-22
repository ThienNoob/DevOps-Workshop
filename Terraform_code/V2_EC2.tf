provider "aws" {
  region = "us-east-1"
}


resource "aws_security_group" "demo-security-group" {
  name        = "demo-security-group"
  description = "SSH and HTTP access"
  

  tags = {
    Name = "allow_ssh"
  }
  ingress {
    description      = "Shh access"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}


resource "aws_instance" "test_ec2" {
    ami = "ami-04a81a99f5ec58529"
    instance_type = "t2.micro"
    tags = {
        Name = "test1_ec2"
    }
    key_name = "project2-keypair"
    security_groups = ["demo-security-group"]
  
}

