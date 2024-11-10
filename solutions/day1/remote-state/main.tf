terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.profile

  default_tags {
    tags = {
      environment = "dev"
      owner       = var.owner
      terraform   = true
    }
  }
}

# create a s3 bucket for storing terraform state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = "terraform-bootcamp-24681" //data.aws_secretsmanager_secret_version.secret-version.secret_string 

  tags = {
    Name = "terraform-bootcamp-24681" //data.aws_secretsmanager_secret_version.secret-version.secret_string 
  }
}

resource "aws_s3_bucket_versioning" "tfstate_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# create a dynamodb table for state locking
resource "aws_dynamodb_table" "terraform-state-locking" {
  name         = "state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}