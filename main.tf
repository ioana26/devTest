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
  }
}
