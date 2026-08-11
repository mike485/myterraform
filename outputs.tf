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

