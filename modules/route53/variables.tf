variable "domain_name" {
  description = "The domain name for Route53"
  type        = string
}

variable "cloudfront_domain_name" {
  description = "The domain name from CloudFront"
  type        = string
}

variable "cloudfront_hosted_zone_id" {
  description = "The hosted zone ID from CloudFront"
  type        = string
}

variable "environment" {
  description = "The environment (dev, stage, prod)"
  type        = string
}