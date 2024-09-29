provider "aws" {
  region = var.region
}

# VPC module
module "vpc" {
  source      = "./modules/vpc"
  environment = var.environment
  cidr_block  = var.cidr_block
}

# Route53 module
module "route53" {
  source                  = "./modules/route53"
  domain_name             = var.domain_name
  cloudfront_domain_name   = module.cloudfront.domain_name
  cloudfront_hosted_zone_id = module.cloudfront.hosted_zone_id
  environment             = var.environment
}

# CloudFront module
module "cloudfront" {
  source      = "./modules/cloudfront"
  s3_bucket   = module.s3.bucket_name
  domain_name = var.domain_name  # Ensure domain_name is used
  environment = var.environment
}

# S3 module
module "s3" {
  source      = "./modules/s3"
  environment = var.environment
}

# DynamoDB module
module "dynamodb" {
  source      = "./modules/dynamodb"
  environment = var.environment
}

# ElastiCache module
module "elasticache" {
  source      = "./modules/elasticache"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
}

# Elasticsearch module
module "elasticsearch" {
  source      = "./modules/elasticsearch"
  environment = var.environment
  vpc_id      = module.vpc.vpc_id
  subnet_ids  = module.vpc.private_subnets
}