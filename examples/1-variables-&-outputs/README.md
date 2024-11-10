# Variables & Outputs Example

This example demonstrates how to effective use variables and outputs in terraform.

## Prerequisites
- AWS credentials configured
- Terraform installed

## Usage
1. Navigate to this directory
2. Run `terraform init`
3. Run `terraform plan`
4. Run `terraform apply`

## Clean Up
Run `terraform destroy` when done

## Notes
### You can assign values to variables in several ways
#### Throught a default value in the variables block
```hcl
variable "profile" {
  type        = string
  description = "AWS IAM profile name"
  default     = "terraform-bootcamp"
}

```
#### Using a tfvars file eg.terraform.tfvars or production.tfvars

```hcl
profile = "default"

```
#### As a command-line flag: specify values at runtime using the -var option
```bash
terraform apply -var="region=eu-west-1" -var="db-name=terraform-bootcamp"
```
### Environment variables: Set variables with the prefix TF_VAR_
```bash
export TF_VAR_db_password="my-secret-password"
```
#### As a command-line flag: specify tfvars file at runtime using the -var-file option
```bash
terraform apply -var-file='dev.tfvars'
```