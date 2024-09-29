resource "aws_security_group" "elasticsearch_sg" {
  name        = "${var.environment}-elasticsearch-sg"
  description = "Security group for Elasticsearch domain"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this according to your security needs
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-elasticsearch-sg"
    Environment = var.environment
  }
}

resource "aws_elasticsearch_domain" "search" {
  domain_name           = "${var.environment}-t2s-search"
  elasticsearch_version = "7.7"

  cluster_config {
    instance_type        = "t3.small.elasticsearch"
    instance_count       = 1
    zone_awareness_enabled = false
  }

  vpc_options {
    subnet_ids         = [element(var.subnet_ids, 0)]  # Only use one subnet
    security_group_ids = [aws_security_group.elasticsearch_sg.id]  # Reference to the security group
  }

  ebs_options {
    ebs_enabled = true
    volume_size = 10
  }

  tags = {
    Environment = var.environment
  }
}