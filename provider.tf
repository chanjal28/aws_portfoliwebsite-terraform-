terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.55.0"  #latest version of the provider
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}