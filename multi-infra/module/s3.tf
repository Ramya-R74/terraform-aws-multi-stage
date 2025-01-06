resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-terra-multi-stage-bucket"
  tags = {
    Name = "${var.env}-terra-multi-stage-bucket"
    Environment = var.env
  }
}