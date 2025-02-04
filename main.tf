provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  backend "s3" {
    bucket = "shakee-terraform-state-bucket"  # Ensure this matches the manually created bucket
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "shakee-terraform-bucket-example"

  tags = {
    Name        = "My Terraform S3 Bucket"
    Environment = "Dev"
  }
}

# Enable versioning for the bucket
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.my_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}
