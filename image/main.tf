#Bucket C will be used to store objects like images of customer signatures

resource "aws_s3_bucket" "image" {
  bucket = var.image_bucket_name
  force_destroy = var.force_destroy

   tags = {
     Name        = "My "
     Environment = "ev"
  }
 }

#Object ownership
resource "aws_s3_bucket_ownership_controls" "image_owner" {
  bucket = aws_s3_bucket.image.id
  rule {
    object_ownership = var.object_ownership
  }
  
}

resource "aws_s3_bucket_acl" "image_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.image_owner]

  bucket = aws_s3_bucket.image.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "image_encryption" {
  bucket = aws_s3_bucket.image.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
    }
  }
}

 #S3 Bucket public access block
resource "aws_s3_bucket_public_access_block" "image_access" {
  bucket = aws_s3_bucket.image.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}

resource "aws_s3_bucket_policy" "allow_product_group_access" {
  bucket = aws_s3_bucket.image.id
  policy = data.aws_iam_policy_document.product_group_access.json
}

