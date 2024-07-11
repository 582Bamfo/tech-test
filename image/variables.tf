variable "image_bucket_name" {
  type = string
  default = "twinkl-image-bucket"
}

variable "force_destroy" {
    type = bool
    default = true
  
}

variable "object_ownership" {
  type = string
  default = "BucketOwnerPreferred"
}

variable "bucket_acl" {
  type = string
  default = "private"
}

variable "sse_algorithm" {
  type = string
  default = "aws:kms"
}

variable "block_public_acls" {
    type = bool
    default = true
}

variable "block_public_policy" {
  type = bool
  default = true
}

variable "ignore_public_acls" {
  type = bool
  default = true
}

variable "restrict_public_buckets" {
  type = bool
  default = true
}