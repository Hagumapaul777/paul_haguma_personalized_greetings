variable "region" {
  description = "AWS region where the EC2 instance will be created"
  type        = string
  default     = "us-east-1"  # Default region
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  
}

variable "key_name" {
  description = "SSH key name for accessing the EC2 instance"
  type        = string
}


variable "instance_name" {
  description = "instance"
  type        = string
}