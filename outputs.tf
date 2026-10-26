
output "network_name" {
  description = "Name of the development VPC network"
  value       = google_compute_network.dev_managenet.name
}

output "network_id" {
  description = "ID of the development VPC network"
  value       = google_compute_network.dev_managenet.id
}

output "network_self_link" {
  description = "Self-link of the development VPC network"
  value       = google_compute_network.dev_managenet.self_link
}

output "prod_network_name" {
  description = "Name of the production VPC network"
  value       = google_compute_network.prod_managenet.name
}

output "prod_network_id" {
  description = "ID of the production VPC network"
  value       = google_compute_network.prod_managenet.id
}

output "prod_network_self_link" {
  description = "Self-link of the production VPC network"
  value       = google_compute_network.prod_managenet.self_link
}

output "dev_to_prod_peering_name" {
  description = "Name of the peering from the development network to production"
  value       = google_compute_network_peering.dev_to_prod.name
}

output "dev_to_prod_peering_state" {
  description = "State of the development-to-production VPC peering"
  value       = google_compute_network_peering.dev_to_prod.state
}

output "prod_to_dev_peering_name" {
  description = "Name of the peering from the production network to development"
  value       = google_compute_network_peering.prod_to_dev.name
}

output "prod_to_dev_peering_state" {
  description = "State of the production-to-development VPC peering"
  value       = google_compute_network_peering.prod_to_dev.state
}

output "subnet_name" {
  description = "Name of the development subnet"
  value       = google_compute_subnetwork.dev_primary_subnet.name
}

output "subnet_id" {
  description = "ID of the development subnet"
  value       = google_compute_subnetwork.dev_primary_subnet.id
}

output "subnet_self_link" {
  description = "Self-link of the development subnet"
  value       = google_compute_subnetwork.dev_primary_subnet.self_link
}

output "subnet_ip_cidr_range" {
  description = "Primary IPv4 CIDR range of the development subnet"
  value       = google_compute_subnetwork.dev_primary_subnet.ip_cidr_range
}

output "prod_subnet_name" {
  description = "Name of the production subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.name
}

output "prod_subnet_id" {
  description = "ID of the production subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.id
}

output "prod_subnet_self_link" {
  description = "Self-link of the production subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.self_link
}

output "prod_subnet_ip_cidr_range" {
  description = "Primary IPv4 CIDR range of the production subnet"
  value       = google_compute_subnetwork.prod_primary_subnet.ip_cidr_range
}

output "iap_ssh_firewall_name" {
  description = "Name of the firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.allow_iap_ssh.name
}

output "iap_ssh_firewall_id" {
  description = "ID of the firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.allow_iap_ssh.id
}

output "iap_ssh_firewall_self_link" {
  description = "Self-link of the firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.allow_iap_ssh.self_link
}

output "prod_iap_ssh_firewall_name" {
  description = "Name of the production firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.prod_allow_iap_ssh.name
}

output "prod_iap_ssh_firewall_id" {
  description = "ID of the production firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.prod_allow_iap_ssh.id
}

output "prod_iap_ssh_firewall_self_link" {
  description = "Self-link of the production firewall rule allowing SSH through IAP"
  value       = google_compute_firewall.prod_allow_iap_ssh.self_link
}

output "prod_icmp_firewall_name" {
  description = "Name of the production firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.prod_allow_icmp.name
}

output "prod_icmp_firewall_id" {
  description = "ID of the production firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.prod_allow_icmp.id
}

output "prod_icmp_firewall_self_link" {
  description = "Self-link of the production firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.prod_allow_icmp.self_link
}

output "prod_http_firewall_name" {
  description = "Name of the production firewall rule allowing HTTP and HTTPS traffic"
  value       = google_compute_firewall.prod_allow_http.name
}

output "prod_http_firewall_id" {
  description = "ID of the production firewall rule allowing HTTP and HTTPS traffic"
  value       = google_compute_firewall.prod_allow_http.id
}

output "prod_http_firewall_self_link" {
  description = "Self-link of the production firewall rule allowing HTTP and HTTPS traffic"
  value       = google_compute_firewall.prod_allow_http.self_link
}

output "prod_http_firewall_ports" {
  description = "TCP ports allowed by the production HTTP firewall rule"
  value = sort(flatten([
    for rule in google_compute_firewall.prod_allow_http.allow : rule.ports
    if rule.protocol == "tcp"
  ]))
}

output "icmp_firewall_name" {
  description = "Name of the firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.allow_icmp.name
}

output "icmp_firewall_id" {
  description = "ID of the firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.allow_icmp.id
}

output "icmp_firewall_self_link" {
  description = "Self-link of the firewall rule allowing ICMP traffic"
  value       = google_compute_firewall.allow_icmp.self_link
}

output "http_firewall_name" {
  description = "Name of the firewall rule allowing HTTP traffic"
  value       = google_compute_firewall.allow_http.name
}

output "http_firewall_id" {
  description = "ID of the firewall rule allowing HTTP traffic"
  value       = google_compute_firewall.allow_http.id
}

output "http_firewall_self_link" {
  description = "Self-link of the firewall rule allowing HTTP traffic"
  value       = google_compute_firewall.allow_http.self_link
}

output "http_firewall_ports" {
  description = "TCP ports allowed by the HTTP firewall rule"
  value = sort(flatten([
    for rule in google_compute_firewall.allow_http.allow : rule.ports
    if rule.protocol == "tcp"
  ]))
}

output "vm_name" {
  description = "Name of the development virtual machine"
  value       = google_compute_instance.dev_vm_1.name
}

output "vm_id" {
  description = "ID of the development virtual machine"
  value       = google_compute_instance.dev_vm_1.id
}

output "vm_internal_ip" {
  description = "Internal IP address of the development virtual machine"
  value       = google_compute_instance.dev_vm_1.network_interface[0].network_ip
}

output "vm_2_name" {
  description = "Name of the second development virtual machine"
  value       = google_compute_instance.dev_vm_2.name
}

output "vm_2_id" {
  description = "ID of the second development virtual machine"
  value       = google_compute_instance.dev_vm_2.id
}

output "vm_2_internal_ip" {
  description = "Internal IP address of the second development virtual machine"
  value       = google_compute_instance.dev_vm_2.network_interface[0].network_ip
}

output "dev_webserver_name" {
  description = "Name of the development web server instance"
  value       = google_compute_instance.dev_webserver1.name
}

output "dev_webserver_id" {
  description = "ID of the development web server instance"
  value       = google_compute_instance.dev_webserver1.id
}

output "dev_webserver_internal_ip" {
  description = "Internal IP address of the development web server instance"
  value       = google_compute_instance.dev_webserver1.network_interface[0].network_ip
}

output "prod_vm_1_name" {
  description = "Name of the first production virtual machine"
  value       = google_compute_instance.prod_vm_1.name
}

output "prod_vm_1_id" {
  description = "ID of the first production virtual machine"
  value       = google_compute_instance.prod_vm_1.id
}

output "prod_vm_1_internal_ip" {
  description = "Internal IP address of the first production virtual machine"
  value       = google_compute_instance.prod_vm_1.network_interface[0].network_ip
}

output "prod_vm_2_name" {
  description = "Name of the second production virtual machine"
  value       = google_compute_instance.prod_vm_2.name
}

output "prod_vm_2_id" {
  description = "ID of the second production virtual machine"
  value       = google_compute_instance.prod_vm_2.id
}

output "prod_vm_2_internal_ip" {
  description = "Internal IP address of the second production virtual machine"
  value       = google_compute_instance.prod_vm_2.network_interface[0].network_ip
}

output "prod_webserver_name" {
  description = "Name of the production web server instance"
  value       = google_compute_instance.prod_webserver2.name
}

output "prod_webserver_id" {
  description = "ID of the production web server instance"
  value       = google_compute_instance.prod_webserver2.id
}

output "prod_webserver_internal_ip" {
  description = "Internal IP address of the production web server instance"
  value       = google_compute_instance.prod_webserver2.network_interface[0].network_ip
}
