########################################
#VPC
########################################

resource "aws_vpc" "main" {
  cidr_block = "15.0.0.0/16"

  tags = {
    Name = "${var.project_name}-${terraform.workspace}"
  }
}

########################################
#INTERNET GATEWAY
########################################

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-${terraform.workspace}"
  }
}


data "aws_availability_zones" "availability_zones" {}

########################################
#SUBNETS
########################################

resource "aws_subnet" "public_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "15.0.0.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = true


  tags = {
    Name = "${var.project_name}-public-subnet-az1-${terraform.workspace}"
  }
}

resource "aws_subnet" "private_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "15.0.1.0/24"
  availability_zone       = data.aws_availability_zones.availability_zones.names[0]
  map_public_ip_on_launch = false


  tags = {
    Name = "${var.project_name}-private-subnet-az1-${terraform.workspace}"
  }
}

########################################
#ROUTE TABLES
########################################

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "${var.project_name}-public-route-table-${terraform.workspace}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  # Local route is automatically created
  # No need to define route for 15.0.0.0/16

  tags = {
    Name = "${var.project_name}-private-route-table-${terraform.workspace}"
  }
}

########################################
#ROUTE TABLES ASSOCIATIONS
########################################

resource "aws_route_table_association" "public_az1" {
  subnet_id      = aws_subnet.public_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_az1" {
  subnet_id      = aws_subnet.private_az1.id
  route_table_id = aws_route_table.private.id
}

