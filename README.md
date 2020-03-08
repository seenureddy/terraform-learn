# terraform-learn

* In `terraform console` we can access the variables.

`> var.myapp
{
  "myKey" = "hello map"
}
> "${var.myapp}"
{
  "myKey" = "hello map"
}
> "${var.myapp["myKey"]}"
hello map
`
