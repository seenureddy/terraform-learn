#  Resources and Modules 

* The main purpose of the Terraform language is declaring `resources.` 

##  Resources 

Resources are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks,
compute instances, or higher-level components such as DNS records.


### Resource Syntax

Resource declarations can include a number of advanced features, but only a small subset are required for initial use.

```
resource "aws_instance" "web" {
  ami           = "ami-a1b2c3d4"
  instance_type = "t2.micro"
}

```

### Resource Types and Arguments 

Each resource is associated with a single resource type, which determines the kind of infrastructure object it manages and what arguments and other attributes 
the resource supports.


Each resource type in turn belongs to `a provider`, which is a plugin for Terraform that `offers a collection of resource types`. A provider usually provides resources 
to manage a single cloud or on-premises infrastructure platform.

##  Providers 

While resources are the primary construct in the Terraform language, `the behaviors of resources rely on their associated resource types, and these types are defined by providers.`

Each provider offers a set of named resource types, and defines for each resource type which arguments it accepts, which attributes it exports, and how changes to resources of that
type are actually applied to remote APIs.

###  Provider Configuration 

A provider configuration is created using a provider block:

```
provider "google" {
  project = "acme-app"
  region  = "us-central1"
}

```

There are also two "meta-arguments" that are defined by Terraform itself and available for all provider blocks:

 * version, for constraining the allowed provider versions
 * alias, for using the same provider with different configurations for different resources


Unlike many other objects in the Terraform language, a provider block may be omitted if its contents would otherwise be empty. 
`Terraform assumes an empty default configuration for any provider that is not explicitly configured.`

### Provider Versions 

`To upgrade to the latest acceptable version of each provider, run terraform init -upgrade.`

Providers are plugins released on a separate rhythm from Terraform itself, and so they have their own version numbers.

When terraform init is run without provider version constraints, it prints a suggested version constraint string for each provider.

To constrain the provider version as suggested, add a required_providers block inside a terraform block:

```
terraform {
  required_providers {
    aws = "~> 1.0"
  }
}

```


### `alias`: Multiple Provider Instances 


You can optionally define multiple configurations for the same provider, and select which one to use on a per-resource or per-module basis. The primary reason for this is to support
multiple regions for a cloud platform; other examples include targeting multiple Docker hosts, multiple Consul hosts, etc.


To include multiple configurations for a given provider, include multiple provider blocks with the same provider name, but set the alias meta-argument to an alias name to use for each additional configuration. For example:

```
# The default provider configuration
provider "aws" {
  region = "us-east-1"
}

# Additional provider configuration for west coast region
provider "aws" {
  alias  = "west"
  region = "us-west-2"
}

```

The provider block without alias set is known as the default provider configuration. When alias is set, it creates an additional provider configuration. For providers that have no required configuration arguments, the implied empty configuration is considered to be the default provider configuration.

#### Referring to Alternate Providers 

When Terraform needs the name of a provider configuration, it always expects a reference of the form <PROVIDER NAME>.<ALIAS>. In the example above, aws.west would refer to the provider with the us-west-2 region.

####  Selecting Alternate Providers

By default, resources use a default provider configuration inferred from the first word of the resource type name. For example, a resource of type aws_instance uses the default (un-aliased) aws provider configuration unless otherwise stated.

To select an aliased provider for a resource or data source, set its provider meta-argument to a <PROVIDER NAME>.<ALIAS> reference:
```
resource "aws_instance" "foo" {
  provider = aws.west

  # ...
}
```

To select aliased providers for a child module, use its `providers meta-argument` to specify which `aliased providers should be mapped to which local provider names` inside the module:

```
module "aws_vpc" {
  source = "./aws_vpc"
  providers = {
    aws = aws.west
  }
}
```
