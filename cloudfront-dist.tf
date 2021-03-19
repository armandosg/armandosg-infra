variable "oai" {
  type = string
}

locals {
  s3_origin_id = "S3-armandoserna.com"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.website_bucket.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = var.oai
    }
  }

  enabled             = true
  default_root_object = "index.html"

  aliases = ["armandoserna.com"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = "PriceClass_100"

  tags = {
    Name = "personal-website"
  }

  viewer_certificate {
    acm_certificate_arn = "arn:aws:acm:us-east-1:926134866312:certificate/133163c1-6c44-4876-81fc-caab69979c19"
  }
}