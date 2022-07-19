provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.GOOGLE_APPLICATION_CREDENTIALS
}
