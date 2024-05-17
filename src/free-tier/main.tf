terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.47.0"
    }
  }
  backend "s3" {
    bucket  = "vb-test-state-bucket-tf"
    region  = "us-east-1"
    key     = "terraform.tfstate"
    encrypt = true

    profile = "pedrorequiao"
  }
}

provider "aws" {
  profile = "pedrorequiao"
}

module "ec2_key_pair" {
  source                  = "../modules/key-pair"
  ec2_ssh_key_name        = var.ec2_ssh_key_name
  ec2_ssh_public_key_path = var.ec2_ssh_public_key_path
}

module "vpc" {
  source = "../modules/vpc"
}

module "public_subnet" {
  source = "../modules/public-subnet"

  vpc_id = module.vpc.vpc_id
}

module "internet_gateway" {
  source = "../modules/internet-gateway"

  vpc_id = module.vpc.vpc_id
}

# module "route_table" {
#   source = "../modules/route-table"

#   vpc_id              = module.vpc.vpc_id
#   internet_gateway_id = module.internet_gateway.internet_gateway_id
#   public_subnet_id    = module.public_subnet.public_subnet_id
# }

module "ec2_security_group" {
  source                         = "../modules/security-group"
  ec2_security_group_name        = var.ec2_security_group_name
  ec2_security_group_description = var.ec2_security_group_description
  vpc_id                         = module.vpc.vpc_id

  tag_name = var.ec2_security_group_name
}

module "ec2_1" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_1_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}

module "ec2_2" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_2_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}

module "ec2_3" {
  source = "../modules/ec2"

  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.public_subnet.public_subnet_3_id
  security_group_id = module.ec2_security_group.security_group_id

  key_name = module.ec2_key_pair.key_name
}

module "lb" {
  source = "../modules/lb"

  lb_vpc_id            = module.vpc.vpc_id
  lb_security_group_id = module.ec2_security_group.security_group_id

  lb_public_subnet_1_id = module.public_subnet.public_subnet_1_id
  lb_public_subnet_2_id = module.public_subnet.public_subnet_2_id
  lb_public_subnet_3_id = module.public_subnet.public_subnet_3_id

  lb_target_id_1 = module.ec2_1.ec2_instance_id
  lb_target_id_2 = module.ec2_2.ec2_instance_id
  lb_target_id_3 = module.ec2_3.ec2_instance_id
}
