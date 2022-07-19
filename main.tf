terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 3.29"
    }
  }
  backend "remote" {
    organization = "iavirvarei"
    workspaces {
      name = "devTest2"
    }
  }
}
