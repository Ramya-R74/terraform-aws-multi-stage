resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "remote-state-lock-bucket-ramya"
  tags = {
    Name = "remote-state-lock-bucket-ramya"
  }
}

resource "aws_dynamodb_table" "my_dynamo_table" {
  name = "remote-state-lock-table-ramya"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
   tags = {
    Name = "remote-state-lock-table-ramya"
  }
}