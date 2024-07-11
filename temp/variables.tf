variable "temp_bucket_name" {
  type = string
  default = "twinkl-temp-bucket"
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

variable "storage_class" {
  type = string
  default = "INTELLIGENT_TIERING"
}

variable "transition_in_days" {
  type = number
  default = 1
}

variable "expiration_in_days" {
  type = number
  default = 2
  
}