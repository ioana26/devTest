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
      name = "DevTest2"
    }
    token = "cABF9S0BN7gaqQ.atlasv1.Xh43DVWXFiOUkmJlayYvirSXT3SuJvX1VNKFfUXq54tjulCnnibyxRrch4NsjexHtyE"
  }
}
  resource "google_storage_bucket" "static-site" {
    name     = "appengine-static-content"
    location = "EU"
  }
