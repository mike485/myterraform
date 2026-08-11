resource "google_compute_instance" "terraform" {
  name         = var.instance_name
  machine_type = var.machine_type
  tags = var.tags // Adding network tags to the instance
  boot_disk {
    initialize_params {
      image = var.image
    }
  }
  network_interface {
    network = var.network
    access_config {
    }
  }
  allow_stopping_for_update = true 
  // Allow to update instance without stopping it
}