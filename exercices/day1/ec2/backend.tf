# backend configuration
terraform {
  backend "s3" {
    bucket         = "bootcamp-tf-state-s3-bucket"
    key            = "terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "state-lock-2"
    encrypt        = true
  }
}

//key = "dev/services/webserver-cluster/terraform.tfstate"
//key = "stage/services/webserver-cluster/terraform.tfstate"