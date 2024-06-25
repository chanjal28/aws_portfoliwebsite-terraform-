#create s3 bucket
resource "aws_s3_bucket" "mys3bucket" {
 bucket = var.bucketname
}

#adding the ownership of the bucket"

resource "aws_s3_bucket_ownership_controls" "mys3bucket" {
  bucket = aws_s3_bucket.mys3bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

#make the bucket public

resource "aws_s3_bucket_public_access_block" "mys3bucket" {
  bucket = aws_s3_bucket.mys3bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#we need to make the acl public to access the site

resource "aws_s3_bucket_acl" "mys3bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.mys3bucket,
    aws_s3_bucket_public_access_block.mys3bucket,
  ]

  bucket = aws_s3_bucket.mys3bucket.id
  acl    = "public-read"
}
