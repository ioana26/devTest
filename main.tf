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


resource "google_compute_instance" "default" {
  name         = "java-application"
  machine_type = "e2-medium"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "echo 'Hello World'; apt install git; apt install default-jdk"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = "devops-service-account@my-devops-project-355909.iam.gserviceaccount.com"
    scopes = ["cloud-platform"]
  }
}
