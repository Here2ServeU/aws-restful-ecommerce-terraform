resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name        = "${var.environment}-route53-zone"
    Environment = var.environment
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = var.cloudfront_domain_name
    zone_id                = var.cloudfront_hosted_zone_id
    evaluate_target_health = false
  }
}

output "route53_zone_id" {
  value = aws_route53_zone.main.zone_id
}