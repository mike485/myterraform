
resource "google_compute_network" "dev_managenet" {
  name                         = var.network_name
  project                      = var.project
  description                  = var.network_description
  auto_create_subnetworks      = false
  routing_mode                 = "REGIONAL"
  bgp_best_path_selection_mode = "LEGACY"
}

resource "google_compute_network" "on_prem_vpc" {
  name                         = var.on_prem_vpc_name
  project                      = var.project
  description                  = var.on_prem_vpc_description
  auto_create_subnetworks      = false
  routing_mode                 = "GLOBAL"
  bgp_best_path_selection_mode = "STANDARD"
}

resource "google_compute_network" "prod_managenet" {
  name                         = var.prod_network_name
  project                      = var.project
  description                  = var.prod_network_description
  auto_create_subnetworks      = false
  routing_mode                 = "REGIONAL"
  bgp_best_path_selection_mode = "LEGACY"
}

resource "google_compute_network_peering" "dev_to_prod" {
  name         = var.dev_to_prod_peering_name
  network      = google_compute_network.dev_managenet.id
  peer_network = google_compute_network.prod_managenet.id
}

resource "google_compute_network_peering" "prod_to_dev" {
  name         = var.prod_to_dev_peering_name
  network      = google_compute_network.prod_managenet.id
  peer_network = google_compute_network.dev_managenet.id
}

resource "google_compute_subnetwork" "dev_primary_subnet" {
  name                     = var.subnet_name
  project                  = var.project
  description              = var.subnet_description
  ip_cidr_range            = var.subnet_ip_cidr_range
  stack_type               = "IPV4_ONLY"
  network                  = google_compute_network.dev_managenet.id
  region                   = var.subnet_region
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "on_prem_subnet_1" {
  name                     = var.on_prem_subnet_1_name
  project                  = var.project
  description              = var.on_prem_subnet_1_description
  ip_cidr_range            = var.on_prem_subnet_1_ip_cidr_range
  stack_type               = "IPV4_ONLY"
  network                  = google_compute_network.on_prem_vpc.id
  region                   = var.on_prem_subnet_1_region
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "prod_primary_subnet" {
  name                     = var.prod_subnet_name
  project                  = var.project
  description              = var.prod_subnet_description
  ip_cidr_range            = var.prod_subnet_ip_cidr_range
  stack_type               = "IPV4_ONLY"
  network                  = google_compute_network.prod_managenet.id
  region                   = var.prod_subnet_region
  private_ip_google_access = true
}
