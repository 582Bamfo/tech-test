# Buckets A and B will be used to host a Single Page Application behind cloudfront

resource "aws_s3_bucket" "static" {
  bucket = var.static_bucket_name
  force_destroy = var.force_destroy

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

#Object ownership
resource "aws_s3_bucket_ownership_controls" "static_owner" {
  bucket = aws_s3_bucket.static.id
  rule {
    object_ownership = var.object_ownership
  }
}

resource "aws_s3_bucket_acl" "static_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.static_owner]

  bucket = aws_s3_bucket.static.id
  acl    = var.bucket_acl
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_encryption" {
  bucket = aws_s3_bucket.static.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = var.sse_algorithm
    }
  }
}


resource "aws_s3_bucket_website_configuration" "static_web" {
  bucket = aws_s3_bucket.static.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}


# S3 Bucket public access block
resource "aws_s3_bucket_public_access_block" "static_access" {
  bucket = aws_s3_bucket.static.id

  block_public_acls       = var.block_public_acls
  block_public_policy     = var.block_public_policy
  ignore_public_acls      = var.ignore_public_acls
  restrict_public_buckets = var.restrict_public_buckets
}



# CloudFront Distribution
resource "aws_cloudfront_distribution" "static_distribution" {
  enabled             = var.enabled
  is_ipv6_enabled     = var.is_ipv6_enabled
  default_root_object = var.default_root_object
  
  origin {
    domain_name              = aws_s3_bucket.static.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.static_oac.id
    origin_id                = "S3-${aws_s3_bucket.static.id}"
  }

  default_cache_behavior {
    allowed_methods        = var.default_cache_behavior_allow_method
    cached_methods         = var.default_cache_behavior_cache_method
    target_origin_id       = "S3-${aws_s3_bucket.static.id}"
    viewer_protocol_policy = var.viewer_protocol_policy
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    compress               = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}


# CloudFront Origin Access Control
resource "aws_cloudfront_origin_access_control" "static_oac" {
  name                              = "static_web_oac"
  description                       = "OAC for Static Site S3 Bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}


resource "aws_s3_bucket_policy" "static_site" {
  bucket = aws_s3_bucket.static.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

