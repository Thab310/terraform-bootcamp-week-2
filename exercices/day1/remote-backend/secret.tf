//2-tf-state-s3-bucket

data "aws_secretsmanager_secret" "secret" {
  name = "2-tf-state-s3-bucket"
}

data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}