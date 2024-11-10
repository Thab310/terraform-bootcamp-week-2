
# EC2 Instances in Public Subnet
resource "aws_instance" "public_1" {
  ami           = "ami-0d64bb532e0502c46"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_az1.id

  vpc_security_group_ids = [aws_security_group.public.id]
  key_name               = aws_key_pair.public_instance_1.key_name
  # Copy the private key for accessing private instance to public instance
  user_data = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.private_1.private_key_pem}' > /home/ec2-user/private_instance_key.pem
              chmod 400 /home/ec2-user/private_instance_key.pem
              chown ec2-user:ec2-user /home/ec2-user/private_instance_key.pem
              EOF

  tags = {
    Name = "public-${var.project_name}-${terraform.workspace}"
  }
}

# EC2 Instances in Private Subnet
resource "aws_instance" "private_1" {
  ami           = "ami-0d64bb532e0502c46"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_az1.id

  vpc_security_group_ids = [aws_security_group.private.id]
  key_name               = aws_key_pair.private_instance_1.key_name

  tags = {
    Name = "private-${var.project_name}-${terraform.workspace}"
  }
}
