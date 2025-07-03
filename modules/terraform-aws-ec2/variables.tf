
variable "user_data" {}

variable "ami" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "vpc_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance in"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
}

variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "environment" {
  description = "Environment tag"
  type        = string
}
