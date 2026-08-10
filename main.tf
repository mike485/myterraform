terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.37.0"
    }
  }
}

provider "google" {
  project = "gcp-networking-489914"
  region = "us-east1"
  zone = "us-east1-b"
}
resource "google_compute_instance" "terraform" {
  name         = "terraform-vm-1"
  machine_type = "e2-micro"
  tags = ["web", "dev"] // Adding network tags to the instance
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }
  network_interface {
    network = "default"
    access_config {
    }
  }
  allow_stopping_for_update = true 
  // Allow to update instance without stopping it
}
