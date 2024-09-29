variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets where the ElastiCache nodes will be placed"
  type        = list(string)
}