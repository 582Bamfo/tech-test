#Bucket D will be used as a temporary store for text documents before they’ve  been processed and ingested after 24 hours. After 48 hours the objects are
#no longer required.

resource "aws_s3_bucket" "temp" {
  bucket = var.temp_bucket_name
  force_destroy = var.force_destroy

  tags = {
    Name        = " bucket"
    Environment = "De"
  }
}

#Object ownership
resource "aws_s3_bucket_ownership_controls" "temp_owner" {
  bucket = aws_s3_bucket.temp.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "temp_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.temp_owner]

  bucket = aws_s3_bucket.temp.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "temp_encryption" {
  bucket = aws_s3_bucket.temp.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
    }
  }
}


#S3 Bucket public access block
resource "aws_s3_bucket_public_access_block" "temp_encryption_access" {
  bucket = aws_s3_bucket.temp.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_policy" "allow_product_group_access" {
  bucket = aws_s3_bucket.temp.id
  policy = data.aws_iam_policy_document.product_group_access.json
}



resource "aws_s3_bucket_lifecycle_configuration" "temporary_lifecycle" {
  bucket = aws_s3_bucket.temp.id

  rule {
    id     = "process_and_expire"
    status = "Enabled"

    transition {
      days          = var.transition_in_days
      storage_class = var.storage_class
    }

    expiration {
      days = var.expiration_in_days
    }
  }
}