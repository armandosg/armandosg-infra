resource "aws_s3_bucket" "website_bucket" {
  bucket = "armandoserna.com"
  acl    = "private"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}