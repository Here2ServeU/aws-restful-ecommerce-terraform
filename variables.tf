variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the e-commerce site"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}