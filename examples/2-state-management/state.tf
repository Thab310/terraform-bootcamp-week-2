# Example of a backend configuration
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}