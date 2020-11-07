module "elasticache_redis" {
  source                = "git::https://github.com/cloudposse/terraform-aws-elasticache-redis.git?ref=master"
  name                  = "redis-elasticache-example"
  number_cache_clusters = 3
  node_type             = "cache.m3.medium"

  engine_version             = "5.0.0"
  port                       = 56379
  maintenance_window         = "mon:10:40-mon:11:40"
  snapshot_window            = "09:10-10:10"
  snapshot_retention_limit   = 1
  automatic_failover_enabled = false
  at_rest_encryption_enabled = false
  transit_encryption_enabled = false
  apply_immediately          = true
  family                     = "redis5.0"
  description                = "example-redis"

  subnet_ids         = var.vpc_private_subnets
  vpc_id             = module.vpc.vpc_id
  source_cidr_blocks = var.vpc_cidr

  tags = {
    Environment = "test"
  }
}