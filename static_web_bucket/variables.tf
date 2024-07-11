variable "static_bucket_name" {
  type = string
  default = "twinkl-static-bucket"
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

variable "enabled" {
  type = bool
  default = true
}

variable "is_ipv6_enabled" {
  type = bool
  default = true
}

variable "default_root_object" {
    type = string
    default = "index.html" 
}

variable "default_cache_behavior_allow_method" {
    type = list(string)
    default = [ "GET", "HEAD", "OPTIONS" ]

}

variable "default_cache_behavior_cache_method" {
  type = list(string)
  default = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  type = string
  default = "redirect-to-https"
    
}