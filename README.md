## AWS E-commerce Infrastructure Deployment with Terraform

This project automates the deployment of a RESTful e-commerce website infrastructure on AWS using Terraform. The infrastructure is designed to be highly available, scalable, cost-efficient, and secure. It includes services like VPC, S3, CloudFront, DynamoDB, ElastiCache, Elasticsearch, and Route 53 for domain management.

#### Project Overview

**The infrastructure is set up using AWS services and includes the following components:**

	•	VPC and Subnets: A custom Virtual Private Cloud (VPC) with public and private subnets.
	•	S3: Storage for product images, log files, clickstream data, purchase requests, and payment over SSL.
	•	CloudFront: A content delivery network (CDN) for serving content globally with SSL termination.
	•	DynamoDB: A NoSQL database for storing product catalog, user profiles, and transactions.
	•	ElastiCache (Redis): In-memory caching for accelerating cart checkout processes.
	•	Elasticsearch: Full-text search capabilities for product search.
	•	Route 53: DNS management for your domain (www.t2s-products.com).
	•	Security: Configured security groups, IAM roles, and policies for securing resources.

#### Pre-requisites

Before running this Terraform project, ensure you have the following tools and dependencies installed:

	•	Terraform (version 0.12+)
	•	AWS CLI configured with the necessary credentials
	•	An AWS account
	•	A registered domain (for Route 53) and hosted zone
	•	SSH key pair (if you want to connect to EC2 instances)

**File Structure**
t2s-products-terraform/
├── main.tf                # Root Terraform configuration
├── variables.tf           # Global variable definitions
├── outputs.tf             # Output values after infrastructure creation
├── terraform.tfvars       # Environment-specific variables
├── modules/
│   ├── vpc/               # VPC and subnet configuration
│   ├── s3/                # S3 bucket configuration
│   ├── cloudfront/        # CloudFront distribution
│   ├── dynamodb/          # DynamoDB tables for product catalog and user data
│   ├── elasticache/       # ElastiCache for cart checkout caching
│   ├── elasticsearch/     # Elasticsearch domain for search functionality
│   ├── route53/           # Route 53 domain configuration
├── environments/
│   ├── dev/
│   ├── stage/
│   ├── prod/

#### Setting up the Environment

##### Clone the Repository:
