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
resource "google_compute_firewall" "ssh" {
  name = "allow-ssh"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = "default"
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}