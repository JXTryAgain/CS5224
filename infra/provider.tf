terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 3.27"
        }
    }
    required_version = "~> 0.14"
    
    backend "s3" {
        bucket = "cs5224-hdb-price-prediction"
        key    = "terraform/terraform.tfstate"
        region = "us-east-1"
  }
}

provider "aws" {
    #profile = "default"
    region = var.aws_region
}