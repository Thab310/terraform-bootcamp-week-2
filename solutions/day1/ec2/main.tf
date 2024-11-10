resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type

  tags = {
    "Name" = "mywebserver-${terraform.workspace}"
  }
}

//terraform apply -var-file='dev.tfvars'
//terraform apply -var-file='stage.tfvars'
//terraform apply -var-file='prod.tfvars'