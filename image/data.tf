data "aws_iam_role" "product_group" {
  name = "twinkl-product-team"  # Replace with your IAM group name
}


locals {
  product_group_arn = data.aws_iam_role.product_group.arn
}

data "aws_iam_policy_document" "product_group_access" {
  statement {

    principals { 
    type = "AWS" 
    identifiers = [data.aws_iam_role.product_group.arn]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.image.arn,
      "${aws_s3_bucket.image.arn}/*",
    ]
  }
}


