
variable "myvar" {
	type = string
	description = "Test var"
	default = "hello terraform"
}

variable "myapp" {
	type = map(string)
	default = {
	myKey = "hello map"
	}
}

variable "myList" {
	type = list
	default = [1,2,3]
}


variable "docker_ports" {
	type = list(object({
		internal = number
		external = number
		protocal = string
	}))
	default = [
	{
		internal = 8300
		external = 8300
		protocal = "tcp"
	}
	]
}

variable "image_id" {
	type = string
	description = "The id of the machine image (AMI) to use for the server."

	validation {
	condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
	}
}
