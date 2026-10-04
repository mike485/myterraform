resource "google_compute_instance" "terraform" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags         = var.tags // Adding network tags to the instance
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.secondary_subnet.name
  }
  allow_stopping_for_update = true
  // Allow to update instance without stopping it
}

resource "google_compute_instance" "terraform_vm_2" {
  name         = "terraform-vm-1"
  machine_type = "e2-micro"
  tags         = var.tags

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.primary_subnet.name
  }

  allow_stopping_for_update = true
}