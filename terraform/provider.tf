terraform {
  required_version = "1.6.2"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.22.0"
    }
  }

  cloud {
    workspaces {
      tags = ["stage:prd"]
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      account    = local.account_alias
      stage      = local.stage
      managed-by = "terraform"
    }
  }
}
