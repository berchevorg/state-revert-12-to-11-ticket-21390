terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "berchevorg"

    workspaces {
     name = "revert-12-to-11"
    }
  }
}

variable "key_name" {
    default = "berchev_key_pair"
}
variable "instance_type" {
    default = "t2.micro"
}
variable "ami" {
    default = "ami-40d28157"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "server" {
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = "true"
}