# VPC Network
resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
  description             = var.vpc_description
}

# Subnet in the primary region
resource "google_compute_subnetwork" "primary_subnet" {
  name          = var.primary_subnet_name
  ip_cidr_range = var.primary_subnet_cidr
  network       = google_compute_network.vpc_network.id
  region        = var.region
  description   = "Primary subnet in ${var.region}"

  private_ip_google_access = var.private_ip_google_access

  log_config {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

# Subnet in the secondary region
resource "google_compute_subnetwork" "secondary_subnet" {
  name          = var.secondary_subnet_name
  ip_cidr_range = var.secondary_subnet_cidr
  network       = google_compute_network.vpc_network.id
  region        = var.region
  description   = "Secondary subnet in ${var.region}"

  private_ip_google_access = var.private_ip_google_access
}


# Firewall Rule - Allow internal traffic
resource "google_compute_firewall" "allow_internal" {
  name    = "${var.vpc_name}-allow-internal"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [var.primary_subnet_cidr, var.secondary_subnet_cidr]
}

# Firewall Rule - Allow SSH ########################################
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.vpc_name}-allow-ssh"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.allow_ssh_from
  target_tags   = ["ssh"]
}

# Firewall Rule - Allow HTTP
resource "google_compute_firewall" "allow_http" {
  name    = "${var.vpc_name}-allow-http"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http"]
}

# Firewall Rule - Allow HTTPS
resource "google_compute_firewall" "allow_https" {
  name    = "${var.vpc_name}-allow-https"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https"]
}

# Firewall Rule - Allow DNS
resource "google_compute_firewall" "allow_dns" {
  name    = "${var.vpc_name}-allow-dns"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "udp"
    ports    = ["53"]
  }

  allow {
    protocol = "tcp"
    ports    = ["53"]
  }

  source_ranges = [var.primary_subnet_cidr]
}

# Cloud NAT for outbound traffic
resource "google_compute_router" "router" {
  name    = "${var.vpc_name}-router"
  region  = var.region
  network = google_compute_network.vpc_network.id

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.vpc_name}-nat"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
