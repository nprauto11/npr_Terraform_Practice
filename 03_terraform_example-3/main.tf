
# scenario-01: modify the bucket name & i am user name that created already 
# adding the provider aws
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIATMJP6MQCTITR7LKV"
  secret_key = "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"
}

# create an s3 bucket resource 
resource "aws_s3_bucket" "my_s3_bucket" {
  bucket = "npr-tf-test-new"
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
  name = "npr-iam-user-new"
  path = "/system/"
}

output "my_s3_bucket" {
    value = aws_s3_bucket.my_s3_bucket.bucket
}

output "my_s3_bucket_versioning" {
    value = aws_s3_bucket.my_s3_bucket.versioning[0].enabled
}
output "my_iam_user" {
    value = aws_iam_user.my_iam_user.name
}


#scenario-2 create an vpc with cidr 10.100.0.0/16 
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.100.0.0/16"
  tags = {
    name = "npr-vpc"
  }
}


output "my_vpc" {
    value = aws_vpc.my_vpc.tags.name
}
output "my_vpc_cidr" {
    value = aws_vpc.my_vpc.cidr_block
}

# scenario -3 : destroy 

