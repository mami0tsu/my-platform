terraform {
  required_version = "1.6.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }

  cloud {}
}

provider "aws" {
  region = "ap-northeast-1"
}
