terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "tomcat_server" {
  ami             = "ami-0cff7528ff583bf9a"
  instance_type   = "t2.micro"
  key_name        = "devopskp"
  security_groups = ["default"]
  user_data = file("tomcat.sh")

  tags = {
    Name = "Tomcatserver-terraform"
  }
}
  resource "aws_security_group" "default" {
	tags = {
	type = "terraform-test-security-group"
}
}
