## AWS E-commerce Infrastructure Deployment with Terraform

This project automates the deployment of a RESTful e-commerce website infrastructure on AWS using Terraform. The infrastructure is designed to be highly available, scalable, cost-efficient, and secure. It includes services like VPC, S3, CloudFront, DynamoDB, ElastiCache, Elasticsearch, and Route 53 for domain management.

#### Project Overview

**The infrastructure is set up using AWS services and includes the following components:**

* **VPC and Subnets**: A custom Virtual Private Cloud (VPC) with public and private subnets.
* **S3**: Storage for product images, log files, clickstream data, purchase requests, and payment over SSL.
* **CloudFront**: A content delivery network (CDN) for serving content globally with SSL termination.
* **DynamoDB**: A NoSQL database for storing product catalog, user profiles, and transactions.
* **ElastiCache (Redis)**: In-memory caching for accelerating cart checkout processes.
* **Elasticsearch**: Full-text search capabilities for product search.
* **Route 53**: DNS management for your domain (www.t2s-products.com).
* **Security Groups**: Configured security groups, IAM roles, and policies for securing resources.

#### Pre-requisites

Before running this Terraform project, ensure you have the following tools and dependencies installed:

* Terraform (version 0.12+)
* AWS CLI configured with the necessary credentials
* An AWS account
* A registered domain (for Route 53) and hosted zone
* SSH key pair (if you want to connect to EC2 instances)

#### Setting up the Environment

**Clone the Repository:** 
* git clone https://github.com/your-username/t2s-products-terraform.git
* cd t2s-products-terraform

**Configure Terraform Variables:**
Modify the terraform.tfvars file in the environments/ directory based on your environment (dev, stage, or prod). Here’s an example of the prod/terraform.tfvars:

environment = "prod"
domain_name = "www.t2s-products.com"
region      = "us-east-1"
cidr_block  = "10.2.0.0/16"

**Initialize Terraform:**
Initialize the project to download the necessary provider plugins and modules:
* terraform init

**Plan the Infrastructure:**
Before applying changes, you can check the execution plan to ensure the infrastructure will be created as expected:
* terraform plan

**Apply the Infrastructure:**
Deploy the infrastructure to AWS:
* terraform apply 

Confirm the changes when prompted by typing yes.

**Verify the Deployment:**
Once the deployment is complete, Terraform will output important information such as CloudFront domain names, S3 bucket names, and more.
Apply complete! Resources: 42 added, 0 changed, 0 destroyed.

Outputs:
cloudfront_domain_name = "xxxxxxx.cloudfront.net"
s3_bucket_name = "prod-t2s-products-images"
route53_zone_id = "ZXXXXXXXXXXXXX"

**Notes**

	•	CloudFront Propagation: CloudFront distributions might take 10-20 minutes to propagate changes globally.
	•	Route 53 DNS Propagation: Changes to DNS records in Route 53 may take up to 24 hours to propagate globally.

##### Troubleshooting

	1.	ElastiCache Cluster Parameter Group Error: Ensure that the correct Redis version (default.redis7) is used for the parameter group in the elasticache module.
	2.	Elasticsearch Domain Error: Make sure you’re passing exactly one subnet to the Elasticsearch domain, as only one subnet is supported.
	3.	VPC CIDR Conflicts: Ensure the VPC CIDR blocks don’t overlap with any existing networks in your AWS account.
	4.	AWS Limits: Ensure your AWS account has sufficient limits for services like ElastiCache, Elasticsearch, and CloudFront distributions.

##### Cleaning Up Resources

To destroy the infrastructure and avoid ongoing costs, run the following command:
* terraform destroy

