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
    name = "DevTest"
    }
  token = "cABF9S0BN7gaqQ.atlasv1.Xh43DVWXFiOUkmJlayYvirSXT3SuJvX1VNKFfUXq54tjulCnnibyxRrch4NsjexHtyE"
  }
}   
  resource "google_storage_bucket" "bucket" {
    name     = "test-bucket-random-001122"
    location = "EU"
}

  resource "google_storage_bucket" "gcs_bucket" {
    name     = "test-bucket-random-001123"
    location = "EU"
}
