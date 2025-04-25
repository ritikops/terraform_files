resource "aws_s3_bucket" "remote_bucket" {
  bucket = "${var.env}-${var.bucket_name}"
  force_destroy = true

  tags = {
    Name        = "my-tf-test-bucketAPR24"
    Environment = var.env
  }
} 