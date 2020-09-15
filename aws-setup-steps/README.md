# Terraform Commands

* Run `terraform init`
* Run `terraform apply`

* To clean up and delete all resources after you're done, run `terraform destroy`

* Run terraform plan -out out.terraform `to save changes to specific file`
* Run terraform apply out.terraform `build from the previously saved changes`

* Run `terraform plan -out file; terraform apply file; rm file`

* Use the `terraform output` command to list all outputs without applying any changes:

```
$ terraform output
public_ip = 54.174.13.5

```
* And you can run terraform output <OUTPUT_NAME> to see the value of a specific output called <OUTPUT_NAME>:

```
$ terraform output public_ip
54.174.13.5

```

# Environment Variables

* Set your AWS credentials as the environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.
 
 ``` access_key = "ACCESS_KEY_HERE"
 	 secret_key = "SECRET_KEY_HERE"
 	 region     = "us-east-1"
```

# Blog: 

* https://blog.gruntwork.io/an-introduction-to-terraform-f17df9c6d180
* https://github.com/gruntwork-io/intro-to-terraform



