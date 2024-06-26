variable "subnet_should_be_created" {
  description = "Should the Public Subnet be created?"
  type        = bool
  default     = true
}

variable "subnet_name" {
  description = "The Name of the Public Subnet"
  type        = string
  default     = "Free Tier Public Subnet"
}

variable "subnet_cidr_block" {
  description = "The IPv4 CIDR block of the Public Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "subnet_availability_zone_1" {
  description = "The Availability Zone of the Public Subnet"
  type        = string
  default     = "us-east-1a"
}

variable "subnet_availability_zone_2" {
  description = "The Availability Zone of the Public Subnet"
  type        = string
  default     = "us-east-1b"
}

variable "subnet_availability_zone_3" {
  description = "The Availability Zone of the Public Subnet"
  type        = string
  default     = "us-east-1c"
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}