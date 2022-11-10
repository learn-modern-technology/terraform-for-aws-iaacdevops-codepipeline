terraform {
  required_version = "~> 1.3.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.33"
     }

    null = {
      source = "hashicorp/null"
      version = "3.1.1"
    }

    random = {
      source = "hashicorp/random"
      version = "3.4.3"
    }
  }

  backend "s3" {
    
  }

}

provider "aws" {
    region = var.aws_region
}

resource "random_pet" "this" {
  length = 2
}