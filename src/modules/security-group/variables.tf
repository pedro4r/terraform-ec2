variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "ec2_security_group_name" {
  description = "Name of the EC2 security group"
  type        = string
}

variable "ec2_security_group_description" {
  description = "Description of the EC2 security group"
  type        = string
}

variable "tag_name" {
    description = "Name of the EC2 security group"
    type        = string
}