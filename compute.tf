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

resource "google_compute_instance" "prod_vm_1" {
  project      = var.prod_network_project
  name         = var.prod_vm_1_name
  machine_type = var.prod_vm_1_machine_type
  zone         = var.prod_vm_1_zone

  boot_disk {
    initialize_params {
      image = var.prod_vm_1_image
    }
  }

  network_interface {
    network    = google_compute_network.prod_managenet.id
    subnetwork = google_compute_subnetwork.prod_primary_subnet.id
  }
}

resource "google_compute_instance" "prod_vm_2" {
  project      = var.prod_network_project
  name         = var.prod_vm_2_name
  machine_type = var.prod_vm_2_machine_type
  zone         = var.prod_vm_2_zone

  boot_disk {
    initialize_params {
      image = var.prod_vm_2_image
    }
  }

  network_interface {
    network    = google_compute_network.prod_managenet.id
    subnetwork = google_compute_subnetwork.prod_secondary_subnet.id
  }
}