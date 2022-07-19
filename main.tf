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

resource "google_service_account" "default" {
  account_id   = "compute_engine_java"
  display_name = "Compute Engine Service Account"
}

resource "google_compute_instance" "default" {
  name         = "java-application"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
    interface = "SCSI"
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "echo hi > /test.txt; apt install git; apt install default-jdk"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}
