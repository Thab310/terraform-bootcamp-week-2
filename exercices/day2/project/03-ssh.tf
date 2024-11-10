# Generate private key for accessing public instance
resource "tls_private_key" "public_1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate private key for public->private instance access
resource "tls_private_key" "private_1" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS key pair for public instance
resource "aws_key_pair" "public_instance_1" {
  key_name   = "public-instance-key"
  public_key = tls_private_key.public_1.public_key_openssh
}

# Create AWS key pair for private instance
resource "aws_key_pair" "private_instance_1" {
  key_name   = "private-instance-key"
  public_key = tls_private_key.private_1.public_key_openssh
}

# Save private key for public instance locally
resource "local_file" "public_instance_key" {
  content         = tls_private_key.public_1.private_key_pem
  filename        = "${path.module}/public-instance-key.pem"
  file_permission = "0400"
}

# Save private key for private instance locally
resource "local_file" "private_instance_key" {
  content         = tls_private_key.private_1.private_key_pem
  filename        = "${path.module}/private-instance-key.pem"
  file_permission = "0400"
}