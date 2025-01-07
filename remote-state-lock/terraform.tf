terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.80.0"
    }
  }
   backend "s3" {
    bucket         = "remote-state-lock-bucket-ramya" # change this
    key            = "./terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "remote-state-lock-table-ramya"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-1"
}