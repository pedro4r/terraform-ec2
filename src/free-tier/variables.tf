variable "profile" {
  description = "AWS Profile"
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "Region for AWS resources"
  type        = string
  default     = "us-east-1"
}

variable "ec2_security_group_description" {
  description = "The Description of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ec2_security_group_name" {
  description = "The Name of the EC2 Security Group"
  type        = string
  default     = "Free Tier EC2 Security Group"
}

variable "ec2_ssh_key_name" {
  description = "The SSH Key Name"
  type        = string
  default     = "free-tier-ec2-key"
}

variable "ec2_ssh_public_key_path" {
  description = "The local path to the SSH Public Key"
  type        = string
  default     = "./provision/access/free-tier-ec2-key.pub"
}

variable "route_table_should_be_created" {
  description = "Determines whether a route table should be created"
  type        = bool
  default     = true
}