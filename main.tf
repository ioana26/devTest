terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.29"
    }
  }
  cloud {
    organization = "iavirvarei"
    workspaces {
      name = "devTest2"
    }
    token = "cABF9S0BN7gaqQ.atlasv1.Xh43DVWXFiOUkmJlayYvirSXT3SuJvX1VNKFfUXq54tjulCnnibyxRrch4NsjexHtyE"
  }
}
