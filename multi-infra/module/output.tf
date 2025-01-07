output "ec2_public_ip" {
  value = aws_instance.ec2_instance[*].public_ip
}

output "ec2_type" {
  value = aws_instance.ec2_instance[*].instance_type
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "table_name" {
  value = aws_dynamodb_table.my_table.name
}