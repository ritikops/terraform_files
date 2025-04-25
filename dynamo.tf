resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "${var.env}-env-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key
  attribute {
    name = "StudentID"
    type = "S"
  }

  tags = {
    Name        = "${var.env}-env-table"    
    Environment = var.env
  }
}




