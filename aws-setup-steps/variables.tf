# ---------------------------------------------------------------------------------------------------------------------
# ENVIRONMENT VARIABLES
# Define these secrets as environment variables
# Doc: https://learn.hashicorp.com/tutorials/terraform/aws-variables
# Doc: https://upcloud.com/community/tutorials/terraform-variables/
# ---------------------------------------------------------------------------------------------------------------------

# AWS_ACCESS_KEY_ID = "ACCESS_KEY_HERE"
# AWS_SECRET_ACCESS_KEY = "SECRET_KEY_HERE"


variable "AWS_ACCESS_KEY_ID" {
  type = string 
}

variable "AWS_SECRET_ACCESS_KEY" {
  type = string 
}

variable "AWS_REGION" {
  type = string
}


