variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

terraform {
  backend "s3" {
    bucket = "terraform-remote-backed-armando"
    key    = "remotedemo.tfstate"
    region = "us-east-2"
    access_key = var.access_key
    secret_key = var.secret_key
    dynamodb_table = "	armandoserna-infra-state"
  }
}