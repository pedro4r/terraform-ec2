resource "aws_subnet" "public_subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.subnet_availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_name} - ${terraform.workspace}"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.subnet_availability_zone_2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_name} - ${terraform.workspace}"
  }
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.subnet_availability_zone_3
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_name} - ${terraform.workspace}"
  }
}