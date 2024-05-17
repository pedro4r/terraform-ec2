resource "random_pet" "ec2_name" {
  length    = 2
  separator = "-"
}

resource "aws_instance" "ec2" {
  ami                         = var.ec2_ami
  instance_type               = var.ec2_instance_type

  

  subnet_id                   = var.public_subnet_id

  vpc_security_group_ids = [var.security_group_id]
  associate_public_ip_address = true

  key_name = var.key_name
  # key_name = "free-tier-ec2-key"

  tags = {
    Name = "Free Tier EC2 ${terraform.workspace} - ${random_pet.ec2_name.id}"
  }
}