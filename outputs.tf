output "instance_name" {
  description = "Name of the compute instance"
  value       = google_compute_instance.terraform.name
}

output "instance_id" {
  description = "Provider-assigned ID of the instance"
  value       = google_compute_instance.terraform.id
}

output "self_link" {
  description = "Self-link URL for the instance"
  value       = google_compute_instance.terraform.self_link
}

output "external_ip" {
  description = "External (NAT) IP address assigned to the instance, if any"
  value       = try(google_compute_instance.terraform.network_interface[0].access_config[0].nat_ip, "")
}

output "internal_ip" {
  description = "Internal network IP of the instance"
  value       = try(google_compute_instance.terraform.network_interface[0].network_ip, "")
}

output "zone" {
  description = "Zone where the instance is provisioned"
  value       = google_compute_instance.terraform.zone
}

output "prod_vm_1_name" {
  description = "Name of the production VM instance"
  value       = google_compute_instance.prod_vm_1.name
}

output "prod_vm_1_id" {
  description = "Provider-assigned ID of the production VM instance"
  value       = google_compute_instance.prod_vm_1.id
}

output "prod_vm_1_self_link" {
  description = "Self-link of the production VM instance"
  value       = google_compute_instance.prod_vm_1.self_link
}

output "prod_vm_1_internal_ip" {
  description = "Internal IP address of the production VM instance"
  value       = google_compute_instance.prod_vm_1.network_interface[0].network_ip
}

output "prod_vm_2_name" {
  description = "Name of the second production VM instance"
  value       = google_compute_instance.prod_vm_2.name
}

output "prod_vm_2_id" {
  description = "Provider-assigned ID of the second production VM instance"
  value       = google_compute_instance.prod_vm_2.id
}

output "prod_vm_2_self_link" {
  description = "Self-link of the second production VM instance"
  value       = google_compute_instance.prod_vm_2.self_link
}

output "prod_vm_2_internal_ip" {
  description = "Internal IP address of the second production VM instance"
  value       = google_compute_instance.prod_vm_2.network_interface[0].network_ip
}

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

output "secondary_subnet_name" {
  description = "Name of the secondary subnet"
  value       = google_compute_subnetwork.secondary_subnet.name
}

output "secondary_subnet_id" {
  description = "ID of the secondary subnet"
  value       = google_compute_subnetwork.secondary_subnet.id
}

output "secondary_subnet_self_link" {
  description = "Self-link of the secondary subnet"
  value       = google_compute_subnetwork.secondary_subnet.self_link
}

output "secondary_subnet_cidr" {
  description = "CIDR range of the secondary subnet"
  value       = google_compute_subnetwork.secondary_subnet.ip_cidr_range
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

output "prod_secondary_subnet_name" {
  description = "Name of the production secondary subnet"
  value       = google_compute_subnetwork.prod_secondary_subnet.name
}

output "prod_secondary_subnet_self_link" {
  description = "Self-link of the production secondary subnet"
  value       = google_compute_subnetwork.prod_secondary_subnet.self_link
}

output "prod_secondary_subnet_cidr" {
  description = "CIDR range of the production secondary subnet"
  value       = google_compute_subnetwork.prod_secondary_subnet.ip_cidr_range
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
