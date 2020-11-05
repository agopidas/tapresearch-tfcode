variable "region" {
  default = "us-east-2"
}

variable "name" {
  default = "tapresearch-aws-three-tier"
}

variable "public_key" {
  default = "./keys/region-nyc.pub"
}

# VPC Variables
variable "vpc_env" {
  description = "VPC environment"
  default     = "dev"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "10.7.0.0/16"
}

variable "vpc_azs" {
  description = "A list of availability zones in the region"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  default     = ["10.7.1.0/24", "10.7.2.0/24", "10.7.3.0/24"]
}

variable "vpc_private_subnets" {
  description = "A list of private subnets inside the VPC"
  default     = ["10.7.11.0/24", "10.7.12.0/24", "10.7.13.0/24"]
}

variable "vpc_database_subnets" {
  type        = list(string)
  description = "A list of database subnets"
  default     = ["10.7.21.0/24", "10.7.22.0/24", "10.7.23.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "vpc_single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = false
}

variable "vpc_one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  default     = true
}

# DB Aurora RDS SQL 
variable "db_identifier" {
  description = "The name of the Aurora SQL DB instance"
  default     = "taurorasqlaws"
}

variable "db_allocated_storage" {
  description = "The allocated storage in GB"
  default     = 5
}

variable "db_name" {
  description = "The DB name to create"
  default     = "aurora-sql"
}

variable "db_username" {
  description = "Username for the master DB user"
  default     = "taurorasqluser"
}

variable "db_password" {
  description = "Password for the master DB user"
  default     = "taurorasqldbpassword"
}

variable "db_port" {
  description = "The port on which the DB accepts connections"
  default     = 5432
}

variable "db_maintenance_window" {
  description = "The window to perform maintenance in"
  default     = "Mon:00:00-Mon:03:00"
}

variable "db_backup_window" {
  description = "The daily time range (in UTC) during which automated backups are created if they are enabled"
  default     = "04:00-07:00"
}

variable "db_backup_retention_period" {
  description = "The days to retain backups for"
  default     = 0
}

variable "db_engine" {
  description = "DB Aurora SQL engine"
  default     = "mysql"
}

variable "db_engine_version" {
  description = "Aurora DB engine version"
  default     = "5.7.mysql_aurora.2.03.2"
}

variable "db_family" {
  description = "DB family"
  default     = "mysql5.7"
}

variable "db_instance_class" {
  description = "DB instance class"
  default     = "db.t2.medium"
}

# worker
variable "app_port" {
  description = "The port on which the application listens for connections"
  default     = 8080
}

variable "app_instance_type" {
  description = "The EC2 instance type for the application servers"
  default     = "t2.micro"
}

variable "app_autoscale_min_size" {
  description = "The fewest amount of EC2 instances to start"
  default     = 3
}

variable "app_autoscale_max_size" {
  description = "The largest amount of EC2 instances to start"
  default     = 6
}

variable "app_elb_health_check_interval" {
  description = "Duration between health checks"
  default     = 20
}

variable "app_elb_healthy_threshold" {
  description = "Number of checks before an instance is declared healthy"
  default     = 2
}

variable "app_elb_unhealthy_threshold" {
  description = "Number of checks before an instance is declared unhealthy"
  default     = 2
}

variable "app_elb_health_check_timeout" {
  description = "Interval between checks"
  default     = 5
}

variable "app_key_pair_name" {
  description = "Application instance key pair name"
  default     = "tapresearch"
}

# Web

variable "web_port" {
  description = "The port on which the web servers listen for connections"
  default     = 80
}

variable "web_instance_type" {
  description = "The EC2 instance type for the web servers"
  default     = "t2.micro"
}

variable "web_autoscale_min_size" {
  description = "The fewest amount of EC2 instances to start"
  default     = 3
}

variable "web_autoscale_max_size" {
  description = "The largest amount of EC2 instances to start"
  default     = 6
}

variable "web_elb_health_check_interval" {
  description = "Duration between health checks"
  default     = 20
}

variable "web_elb_healthy_threshold" {
  description = "Number of checks before an instance is declared healthy"
  default     = 2
}

variable "web_elb_unhealthy_threshold" {
  description = "Number of checks before an instance is declared unhealthy"
  default     = 2
}

variable "web_elb_health_check_timeout" {
  description = "Interval between checks"
  default     = 5
}

variable "web_key_pair_name" {
  description = "Application instance key pair name"
  default     = "tapresearch"
}

# Memcache / Redis Cache Variables - Elastic

variable "product_domain" {
  description = "Product domain abbreviation this memcached belongs to"
  default        = "tsi"
}

variable "environment" {
  description = "Environment of this memcached resides in"
  default        = "string"
}

variable "description" {
  description = "Description of what this memcached used for"
  default     = "Cache of ec2 inventory search data"
}

variable "service_name" {
  description = "Name of the service this memcached belongs to"
  default        = "tsiecis"
}

variable "maintenance_window" {
  description = "Preferred maintenance window for this memcached"
  default = "sun:15:00-sun:16:00"
}

variable "node_type" {
  description = "Node type for this memcached"
  default     = "cache.m4.large"
}

variable "num_cache_nodes" {
  description = "Number of cache nodes for this memcached"
  default     = "2"
}

variable "parameter_group_name" {
  description = "Name of the parameter group used by this memcached cluster"
  default     = "default.memcached1.4"
}


variable "apply_immediately" {
  description = "Whether to apply cluster changes immediately, or during maintenance window"
  default        = "true"
}

variable "engine_version" {
  description = "Version of memcached engine for this cluster"
  type        = string
  default     = "1.4.34"
}

variable "subnet_group_name" {
  description = "Name of the subnet group this cluster resides in"
  default        = "test"
}

variable "notification_topic_arn" {
  description = "ARN of the SNS topic that should receive notification about this memcached cluster"
  type        = string
  default     = ""
}

variable "port" {
  description = "Port used for this memcached"
  type        = string
  default     = "11211"
}

variable "az_mode" {
  description = "Whether to provision in single-az or cross-az"
  default        = "cross-az"
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Common additional tags"
}
