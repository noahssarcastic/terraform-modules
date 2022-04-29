terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = var.region
}

resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = var.prefix
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  # Enable AES256 server-side encryption by default.
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  # Enable versioning to retain history of state files.
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id

  # Block all public access by default.
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform_locks" {
  name = "${var.prefix}-locks"

  # Should stay within free tier.
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

output "backend" {
  value = templatefile("${path.module}/backend.tftpl", {
    bucket         = aws_s3_bucket.terraform_state.bucket
    region         = var.region
    dynamodb_table = aws_dynamodb_table.terraform_locks.arn
  })
}
