terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
# Uncomment the region, access_key and secret_key if you are running locally
provider "aws" {
  region     = "us-east-1"                # Update accordingly
  # access_key = "xxxx"                     # Update accordingly
  # secret_key = "xxxx"                     # Update accordingly
}