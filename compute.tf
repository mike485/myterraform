resource "google_compute_firewall" "allow_prod_subnet" {
  name          = var.dev_to_prod_firewall_name
  project       = var.project
  description   = "Allow traffic from the production subnet over VPC peering"
  network       = google_compute_network.dev_managenet.id
  direction     = "INGRESS"
  source_ranges = [var.prod_subnet_ip_cidr_range]

  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_dev_subnet" {
  name          = var.prod_to_dev_firewall_name
  project       = var.project
  description   = "Allow traffic from the development subnet over VPC peering"
  network       = google_compute_network.prod_managenet.id
  direction     = "INGRESS"
  source_ranges = [var.subnet_ip_cidr_range]

  allow {
    protocol = "all"
  }
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name        = var.iap_ssh_firewall_name
  project     = var.project
  description = "Allow SSH from Google Cloud IAP"
  network     = google_compute_network.dev_managenet.id
  direction   = "INGRESS"
  priority    = 1000
  source_ranges = [
    var.iap_source_range,
  ]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "prod_allow_iap_ssh" {
  name        = var.prod_iap_ssh_firewall_name
  project     = var.project
  description = "Allow SSH from Google Cloud IAP"
  network     = google_compute_network.prod_managenet.id
  direction   = "INGRESS"
  priority    = 1000
  source_ranges = [
    var.iap_source_range,
  ]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "prod_allow_icmp" {
  name          = var.prod_icmp_firewall_name
  project       = var.project
  network       = google_compute_network.prod_managenet.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = [var.prod_icmp_source_range]

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "prod_allow_http" {
  name          = var.prod_http_firewall_name
  project       = var.project
  network       = google_compute_network.prod_managenet.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = [var.prod_http_source_range]
  target_tags   = [var.prod_http_target_tag]

  allow {
    protocol = "tcp"
    ports    = var.prod_http_firewall_ports
  }
}

resource "google_compute_firewall" "allow_icmp" {
  name          = var.icmp_firewall_name
  project       = var.project
  network       = google_compute_network.dev_managenet.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = [var.icmp_source_range]

  allow {
    protocol = "icmp"
  }
}

resource "google_compute_firewall" "allow_http" {
  name          = var.http_firewall_name
  project       = var.project
  network       = google_compute_network.dev_managenet.id
  direction     = "INGRESS"
  priority      = 1000
  source_ranges = [var.http_source_range]
  target_tags   = [var.http_target_tag]

  allow {
    protocol = "tcp"
    ports    = var.http_firewall_ports
  }
}

resource "google_compute_instance" "dev_vm_1" {
  name         = var.vm_name
  project      = var.project
  machine_type = var.vm_machine_type
  zone         = var.vm_zone

  boot_disk {
    initialize_params {
      image = var.vm_boot_image
    }
  }

  network_interface {
    network    = google_compute_network.dev_managenet.id
    subnetwork = google_compute_subnetwork.dev_primary_subnet.id
  }
}

resource "google_compute_instance" "dev_webserver1" {
  name         = var.dev_webserver_name
  project      = var.project
  machine_type = var.vm_machine_type
  zone         = var.vm_zone
  tags         = [var.http_target_tag]

  boot_disk {
    initialize_params {
      image = var.vm_boot_image
    }
  }

  network_interface {
    network    = google_compute_network.dev_managenet.id
    subnetwork = google_compute_subnetwork.dev_primary_subnet.id
  }

  metadata_startup_script = var.dev_webserver_startup_script
}

resource "google_compute_instance" "prod_vm_1" {
  name         = var.prod_vm_1_name
  project      = var.project
  machine_type = var.prod_vm_machine_type
  zone         = var.prod_vm_zone

  boot_disk {
    initialize_params {
      image = var.prod_vm_boot_image
    }
  }

  network_interface {
    network    = google_compute_network.prod_managenet.id
    subnetwork = google_compute_subnetwork.prod_primary_subnet.id
  }
}

resource "google_compute_instance" "prod_webserver2" {
  name         = var.prod_webserver_name
  project      = var.project
  machine_type = var.prod_vm_machine_type
  zone         = var.prod_vm_zone
  tags         = [var.prod_http_target_tag]

  boot_disk {
    initialize_params {
      image = var.prod_vm_boot_image
    }
  }

  network_interface {
    network    = google_compute_network.prod_managenet.id
    subnetwork = google_compute_subnetwork.prod_primary_subnet.id
  }

  metadata_startup_script = var.prod_webserver_startup_script
}