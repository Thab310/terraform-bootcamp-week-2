# create a s3 bucket for storing terraform state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = data.aws_secretsmanager_secret_version.secret-version.secret_string


  tags = {
    Name = data.aws_secretsmanager_secret_version.secret-version.secret_string
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
  name         = "state-lock-2"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
