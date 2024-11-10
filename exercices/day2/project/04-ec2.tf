# EC2 Instances in Public Subnet
resource "aws_instance" "public_1" {
  ami           = "ami-0d64bb532e0502c46"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_az1.id

  vpc_security_group_ids = [aws_security_group.public.id]
  key_name               = aws_key_pair.public_instance_1.key_name

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
