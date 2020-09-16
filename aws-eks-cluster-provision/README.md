# AWS-EKS Setup

## Terraform Commands

* Run `terraform init`
* Run `terraform apply`
* To clean up and delete all resources after you're done, run `terraform destroy`


## Kubernetes Commands

* Get the cluster info `kubectl cluster-info`
* Change the namespace `kubectl config set-context --current --namespace=kube-system`
* Get the deployment in different namespace without swittching `kubectl get deployment metrics-server -n kube-system`
* Check logs `kubectl logs <pod-name>`


Docs:
* https://learn.hashicorp.com/tutorials/terraform/eks
* https://github.com/terraform-aws-modules/terraform-aws-eks/tree/master/examples/basic
* https://github.com/hashicorp/learn-terraform-provision-eks-cluster
