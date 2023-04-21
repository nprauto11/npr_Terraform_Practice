
# scenario-01: create s3 bucket with versioning enabled & iam user 
# adding the provider aws
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATMJP6MQCTITR7LKV"
  secret_key = "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"
}

# create an s3 bucket resource 
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "npr-tf-test"
}

# enable versioning to the created bucket 
resource "aws_s3_bucket_versioning" "versioning_my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# create an resource iam user
resource "aws_iam_user" "my_iam_user" {
  name = "npr-iam-user"
  path = "/system/"
}

# scenario-2: print the output values 
output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
output "my_iam_user" {
    value = aws_iam_user.my_iam_user.name
}

# scenario-3: print the output values (extended)
output "my_s3_bucket" {
    value = aws_s3_bucket.my_s3_bucket.bucket
}

