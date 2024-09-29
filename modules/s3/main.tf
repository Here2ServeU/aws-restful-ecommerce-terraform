resource "aws_s3_bucket" "images" {
  bucket = "${var.environment}-t2s-products-images"

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-t2s-products-images"
  }
}

resource "aws_s3_bucket" "logs" {
  bucket = "${var.environment}-t2s-products-logs"

  tags = {
    Environment = var.environment
    Name        = "${var.environment}-t2s-products-logs"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.images.bucket
}