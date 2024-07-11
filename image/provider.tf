terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.10.0"
    }
  }
}

# Provider configuration
provider "aws" {
  region = "eu-west-2"  
}
