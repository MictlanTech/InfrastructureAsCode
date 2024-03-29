terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
      access_key = var.AWS_ACCESS_KEY
      secret_key = var.AWS_SECRET_KEY
      region     = var.AWS_REGION
    }
  }
}
