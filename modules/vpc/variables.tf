variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}