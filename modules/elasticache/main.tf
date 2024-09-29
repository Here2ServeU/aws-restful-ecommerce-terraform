resource "aws_elasticache_cluster" "checkout_cache" {
  cluster_id           = "${var.environment}-t2s-checkout"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"

  subnet_group_name = aws_elasticache_subnet_group.default.name
}

resource "aws_elasticache_subnet_group" "default" {
  name       = "${var.environment}-subnet-group"
  subnet_ids = var.subnet_ids
}

output "cache_cluster_id" {
  value = aws_elasticache_cluster.checkout_cache.cluster_id
}