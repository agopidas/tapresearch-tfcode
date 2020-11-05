locals {
  engine              = "memcached"
  cluster_id_format   = "%s-%s-"
  mem_prefix          = format(local.cluster_id_format, var.service_name, "mem")
  mem_max_name_length = "20"
  mem_max_byte_length = floor((local.mem_max_name_length - length(local.mem_prefix)) / 2)
  mem_byte_length     = min(local.mem_max_name_length, local.mem_max_byte_length)
}

resource "random_id" "cluster_id" {
  prefix      = local.mem_prefix
  byte_length = local.mem_max_byte_length
}

resource "aws_elasticache_cluster" "tapsearch-memcache" {
  cluster_id           = random_id.cluster_id.hex
  engine               = local.engine
  engine_version       = var.engine_version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  port                 = var.port
  apply_immediately    = var.apply_immediately
  az_mode              = var.az_mode
  parameter_group_name = var.parameter_group_name
  subnet_group_name    = var.subnet_group_name
  maintenance_window   = var.maintenance_window

  security_group_ids = [aws_security_group.elb.id]

  notification_topic_arn = var.notification_topic_arn

  tags = merge(
    var.additional_tags,
    {
      "Name" = random_id.cluster_id.hex
    },
    {
      "Environment" = var.environment
    },
    {
      "ProductDomain" = var.product_domain
    },
    {
      "Service" = var.service_name
    },
    {
      "Description" = var.description
    },
    {
      "ManagedBy" = "terraform"
    },
  )
}