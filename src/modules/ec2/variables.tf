variable "ec2_should_be_created" {
  description = "Should the EC2 be created?"
  type        = bool
  default     = true
}

variable "ec2_name" {
  description = "The Name of the EC2"
  type        = string
  default     = "Free Tier EC2"
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the EC2 instance"
  type        = string
}

variable "ec2_ami" {
  description = "The Amazon Machine Image"
  type        = string
  default     = "ami-04b9e92b5572fa0d1" # Ubuntu 18.04 LTS (64-bit x86)  Free Tier eligible
}

variable "ec2_instance_type" {
  description = "The EC2 Instance type"
  type        = string
  default     = "t2.micro" # Free Tier eligible
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the Public Subnet"
  type        = string
}

variable "key_name" {
  description = "The key pair name to associate with the EC2 instance"
  type        = string
}