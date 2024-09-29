variable "s3_bucket" {
  description = "The S3 bucket used as the origin for CloudFront"
  type        = string
}

variable "domain_name" {
  description = "The domain name for the CloudFront distribution"
  type        = string
}

variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}