# Terraform and AWS

Task & Requirements:

Core Task: Using the AWS Provider, code the following:
● Cluster of application server instances ○ AWS LB in front of this cluster
● Cluster of worker server instances
● Aurora database cluster (MySQL Engine, at least 3 instances)
● Memcached cluster (elasticache)
● Redis cluster (elasticache)
● These items should be contained in a basic VPC with the appropriate pieces:
○ security groups ○ subnets
○ gateways (NAT or otherwise)
○ other infrastructure components as needed, etc

Bonus: None of this is required nor will not doing any of this count against you.
● Sensible directory and file structure
● Provide for mapping cloud assets via AWS API (tags)
● Cloudfront CDN
● Custom terraform modules
● "Precompilation" of terraform code files to allow for more advanced topology
patterns.
● Other creative solutions/ideas

# Keys

touch keys && ssh-keygen -b 2048 -f ./keys/region-nyc

# Usage

1. terraform init
2. Plan
$ terraform plan -var-file=terraform.tfvars -out=tfplan.tf
3. Apply
$ terraform apply "tfplan.tf"