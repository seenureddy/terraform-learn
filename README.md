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

* Removing large files from Git without losing history

`git filter-branch --index-filter 'git rm --cached --ignore-unmatch <file_name>' --tag-name-filter cat -- --all`