# VPC Outputs
output "vpc_name" {
  description = "Name of the VPC network"
  value       = google_compute_network.vpc_network.name
}

output "vpc_id" {
  description = "ID of the VPC network"
  value       = google_compute_network.vpc_network.id
}

output "vpc_self_link" {
  description = "Self-link of the VPC network"
  value       = google_compute_network.vpc_network.self_link
}

output "prod_network_name" {
  description = "Name of the production VPC network"
  value       = google_compute_network.prod_managenet.name
}

output "prod_network_self_link" {
  description = "Self-link of the production VPC network"
  value       = google_compute_network.prod_managenet.self_link
}

output "prod_ssh_firewall_name" {
  description = "Name of the production SSH firewall rule"
  value       = google_compute_firewall.prod_allow_ssh.name
}

output "prod_ssh_firewall_self_link" {
  description = "Self-link of the production SSH firewall rule"
  value       = google_compute_firewall.prod_allow_ssh.self_link
}

output "prod_icmp_firewall_name" {
  description = "Name of the production ICMP firewall rule"
  value       = google_compute_firewall.prod_allow_icmp.name
}

output "prod_icmp_firewall_self_link" {
  description = "Self-link of the production ICMP firewall rule"
  value       = google_compute_firewall.prod_allow_icmp.self_link
}

output "primary_subnet_name" {
  description = "Name of the primary subnet"
  value       = google_compute_subnetwork.primary_subnet.name
}

output "primary_subnet_id" {
  description = "ID of the primary subnet"
  value       = google_compute_subnetwork.primary_subnet.id
}

output "primary_subnet_self_link" {
  description = "Self-link of the primary subnet"
  value       = google_compute_subnetwork.primary_subnet.self_link
}

output "primary_subnet_cidr" {
  description = "CIDR range of the primary subnet"
  value       = google_compute_subnetwork.primary_subnet.ip_cidr_range
}

output "prod_primary_subnet_name" {
  description = "Name of the production primary subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.name
}

output "prod_primary_subnet_self_link" {
  description = "Self-link of the production primary subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.self_link
}

output "prod_primary_subnet_cidr" {
  description = "CIDR range of the production primary subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.ip_cidr_range
}

output "router_name" {
  description = "Name of the Cloud Router"
  value       = google_compute_router.router.name
}

output "router_self_link" {
  description = "Self-link of the Cloud Router"
  value       = google_compute_router.router.self_link
}

output "nat_name" {
  description = "Name of the Cloud NAT"
  value       = google_compute_router_nat.nat.name
}
