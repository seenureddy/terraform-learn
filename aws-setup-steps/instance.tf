# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.12"
}


provider "aws" {

  # access_key = "ACCESS_KEY_HERE"
  # secret_key = "SECRET_KEY_HERE"
  # region     = "ap-south-1"

 
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY

  region     = var.AWS_REGION
}


resource "aws_instance" "example" {

  ami           = "ami-0c28d7c6dd94fb3a7"
  instance_type = "t2.micro"

  # Adding the name aws-instance
  tags = {
    Name = "terraform-example"
  }

}

#provisioner "file" {
#	source = "app.conf"
#	destination = "/etc/myapp.conf"
#}
