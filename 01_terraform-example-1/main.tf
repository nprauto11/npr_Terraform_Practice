# exported access key & secret key to terminal
# $ export AWS_ACCESS_KEY_ID=AKIATMJP6MQCTITR7LKV
# $ export AWS_SECRET_ACCESS_KEY=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

# scenario-01: create s3 bucket
# adding the provider aws
provider "aws" {
  region = "us-east-1"
}

# create an s3 bucket resource 
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "npr-tf-test"
}

# scenario-02: extending s3 bucket
# enable versioning to the created bucket 
resource "aws_s3_bucket_versioning" "versioning_my_s3_bucket" {
  bucket = aws_s3_bucket.my_s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# scenario-03: create an resource iam user
resource "aws_iam_user" "my_iam_user" {
  name = "npr-iam-user"
  path = "/system/"
}