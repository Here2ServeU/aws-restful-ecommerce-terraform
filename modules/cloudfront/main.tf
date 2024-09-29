resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = "${var.s3_bucket}.s3.amazonaws.com"
    origin_id   = "S3-${var.s3_bucket}"
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "CloudFront distribution for ${var.environment} environment"
  default_root_object = "index.html"

  default_cache_behavior {
    target_origin_id       = "S3-${var.s3_bucket}"
    viewer_protocol_policy = "redirect-to-https"

    allowed_methods = ["GET", "HEAD", "OPTIONS"]
    cached_methods  = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_100"

  viewer_certificate {
    cloudfront_default_certificate = true
    # If using a custom SSL certificate:
    # acm_certificate_arn            = "arn:aws:acm:<your-certificate-arn>"
    # ssl_support_method             = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-cloudfront-distribution"
  }
}

output "domain_name" {
  value = aws_cloudfront_distribution.cdn.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.cdn.hosted_zone_id
}