# State Management and Workspaces Example

This example demonstrates how to effective use state management and workspaces in terraform.

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
*s3 bucket must be globally unique*

## Workspaces
### Overview
Terraform workspaces allow you to manage multiple states within a single configuration. By `default`, every Terraform configuration has a default workspace, but additional workspaces can be created to separate states, making it easier to manage environments like development, staging, and production within the same configuration.

### Benefits
* **Environment Separation:** Workspaces let you separate infrastructure states for different environments (e.g., dev, stage, prod), avoiding conflicts and making it easier to manage lifecycle changes for each.

* **Simplified Code Management:** Using workspaces, you don’t need to duplicate configuration files for different environments. Instead, you can use a single codebase and switch states through workspaces.

* **Cost Efficiency:** By creating workspaces for testing environments, you can easily manage and tear down test resources without impacting production resources.

* **Automated Workflows:** Workspaces are ideal for CI/CD pipelines where infrastructure needs to be spun up and down frequently across multiple environments.

### Use Cases
* **Environment Isolation:** Managing multiple environments (e.g., dev, test, prod) in one Terraform configuration. Each environment can use a separate workspace, ensuring isolation and avoiding conflicts between environments.

* **Testing and Development:** Using workspaces to create temporary test environments for feature development or QA testing, keeping them isolated from production environments.

* **Multi-Region Deployments:** Deploying the same infrastructure in different geographic regions by setting up workspaces per region, allowing you to handle region-specific resources within the same configuration.

### Common Commands
* Create a new workspace: `terraform workspace new <workspace_name>`

* Switch between workspaces: `terraform workspace select <workspace_name>`

* List available workspaces: `terraform workspace list`

* Show the current workspace: `terraform workspace show`