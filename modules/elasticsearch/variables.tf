variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "subnet_ids" {
  description = "Subnets for Elasticsearch"
  type        = list(string)
}