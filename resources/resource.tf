provider "aws" {
	
}

variable "AWS_REGION" {
	type = string	
}


variable "AMIS" {
	type = map(string)
	default = {
		eu-west-1 = "my ami"
	}

}


resource "aws_instance" "exampe" {

 # ami           = "ami-a1b2c3d4"
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"

}


resource "aws_instance" "exampe1" {

 # ami           = "ami-a1b2c3d4"
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.small"

}
