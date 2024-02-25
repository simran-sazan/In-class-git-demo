//aws provider setup in tf
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      //version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  #   access_key = "my-access-key"
  #   secret_key = "my-secret-key"
}
