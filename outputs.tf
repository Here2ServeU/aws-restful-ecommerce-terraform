output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "cloudfront_domain_name" {
  value = module.cloudfront.domain_name
}

output "s3_bucket_name" {
  value = module.s3.bucket_name
}

output "dynamodb_table_names" {
  value = module.dynamodb.table_names
}