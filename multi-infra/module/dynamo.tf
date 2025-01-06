resource "aws_dynamodb_table" "my_table" {
    name = "${var.env}-terra-multi-stage-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
      name = "LockID"
      type = "S"
    }
    tags = {
      Name = "${var.env}-terra-multi-stage-table"
      Environment = var.env
    }
  
}