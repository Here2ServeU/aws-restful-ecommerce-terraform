resource "aws_dynamodb_table" "product_catalog" {
  name         = "${var.environment}-t2s-products-catalog"
  billing_mode = "PAY_PER_REQUEST"
  
  hash_key = "product_id"

  attribute {
    name = "product_id"
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}

resource "aws_dynamodb_table" "user_profile" {
  name         = "${var.environment}-t2s-products-users"
  billing_mode = "PAY_PER_REQUEST"
  
  hash_key = "user_id"

  attribute {
    name = "user_id"
    type = "S"
  }

  tags = {
    Environment = var.environment
  }
}

output "table_names" {
  value = [aws_dynamodb_table.product_catalog.name, aws_dynamodb_table.user_profile.name]
}