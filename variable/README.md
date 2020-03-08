# Input Variables 

Input variables serve as parameters for a Terraform module, allowing aspects of the module to be customized without altering the module's own source code, and allowing modules to be shared between different configurations.

Other kinds of variables in Terraform include environment variables (set by the shell where Terraform runs) and expression variables (used to indirectly represent a value in an expression).

## Declaring an Input Variable

Each input variable accepted by a module must be declared using a variable block:

`variable "image_id" {
  type = string
}
`

## Type Constraints 

Type constraints are created from a mixture of type keywords and type constructors. The supported type keywords are:

    string
    number
    bool

The type constructors allow you to specify complex types such as collections:

    list(<TYPE>)
    set(<TYPE>)
    map(<TYPE>)
    object({<ATTR NAME> = <TYPE>, ... })
    tuple([<TYPE>, ...])

## Custom Validation Rules 

a module author can specify arbitrary custom validation rules for a particular variable using a validation block nested within the corresponding variable block.

If the failure of an expression is the basis of the validation decision, use the `can function` to detect such errors

```
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    # regex(...) fails if it cannot find a match
    condition     = can(regex("^ami-", var.image_id))
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```

## Assigning Values to Root Module Variables 


 * In a Terraform Cloud workspace.
 * Individually, with the `-var` command line option.
 * In variable definitions `(.tfvars)` files, either specified on the command line or automatically loaded.
 * As environment variables.
 

### Variables on the Command Line

use the -var option when running the terraform plan and terraform apply commands:

```
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]'
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```

### Variable Definitions (.tfvars) Files 

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:

```
terraform apply -var-file="testing.tfvars"
```

### Environment Variables 

Terraform searches the environment of its own process for environment variables named TF_VAR_ followed by the name of a declared variable.

```
$ export TF_VAR_image_id=ami-abc123
$ terraform plan
```
