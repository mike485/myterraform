variable "project" {
  description = "GCP project ID"
  type        = string
  default     = "gcp-networking-489914"
}

variable "network_name" {
  description = "Name of the development VPC network"
  type        = string
  default     = "dev-managenet"
}

variable "network_description" {
  description = "Description of the development VPC network"
  type        = string
  default     = "Dev network "
}

variable "prod_network_name" {
  description = "Name of the production VPC network"
  type        = string
  default     = "prod-managenet"
}

variable "prod_network_description" {
  description = "Description of the production VPC network"
  type        = string
  default     = "Production Network"
}

variable "dev_to_prod_peering_name" {
  description = "Name of the peering from the development network to production"
  type        = string
  default     = "dev-managenet-to-prod-managenet"
}

variable "prod_to_dev_peering_name" {
  description = "Name of the peering from the production network to development"
  type        = string
  default     = "prod-managenet-to-dev-managenet"
}

variable "subnet_name" {
  description = "Name of the development subnet"
  type        = string
  default     = "dev-primary-subnet"
}

variable "subnet_description" {
  description = "Description of the development subnet"
  type        = string
  default     = "Network dev"
}

variable "subnet_ip_cidr_range" {
  description = "Primary IPv4 CIDR range of the development subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_region" {
  description = "Region of the development subnet"
  type        = string
  default     = "us-east1"
}

variable "prod_subnet_name" {
  description = "Name of the production subnet"
  type        = string
  default     = "prod-primary-subnet"
}

variable "prod_subnet_description" {
  description = "Description of the production subnet"
  type        = string
  default     = "Production subnet"
}

variable "prod_subnet_ip_cidr_range" {
  description = "Primary IPv4 CIDR range of the production subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "prod_subnet_region" {
  description = "Region of the production subnet"
  type        = string
  default     = "us-central1"
}

variable "dev_to_prod_firewall_name" {
  description = "Name of the firewall rule allowing production subnet traffic into development"
  type        = string
  default     = "dev-managenet-allow-prod-subnet"
}

variable "prod_to_dev_firewall_name" {
  description = "Name of the firewall rule allowing development subnet traffic into production"
  type        = string
  default     = "prod-managenet-allow-dev-subnet"
}

variable "iap_ssh_firewall_name" {
  description = "Name of the firewall rule allowing SSH through IAP"
  type        = string
  default     = "dev-managenet-allow-iap-ssh"
}

variable "prod_iap_ssh_firewall_name" {
  description = "Name of the production firewall rule allowing SSH through IAP"
  type        = string
  default     = "prod-managenet-allow-iap-ssh"
}

variable "prod_icmp_firewall_name" {
  description = "Name of the production firewall rule allowing ICMP traffic"
  type        = string
  default     = "prod-managenet-allow-icmp"
}

variable "prod_icmp_source_range" {
  description = "Source range allowed to send ICMP traffic to the production network"
  type        = string
  default     = "0.0.0.0/0"
}

variable "prod_http_firewall_name" {
  description = "Name of the production firewall rule allowing HTTP and HTTPS traffic"
  type        = string
  default     = "prod-managenet-allow-http-traffic"
}

variable "prod_http_source_range" {
  description = "Source range allowed to send HTTP and HTTPS traffic to the production network"
  type        = string
  default     = "0.0.0.0/0"
}

variable "prod_http_target_tag" {
  description = "Network tag for production instances that receive HTTP and HTTPS traffic"
  type        = string
  default     = "http-server"
}

variable "prod_http_firewall_ports" {
  description = "TCP ports allowed by the production HTTP firewall rule"
  type        = list(string)
  default     = ["80", "443"]
}

variable "iap_source_range" {
  description = "Google Cloud IAP TCP forwarding source range"
  type        = string
  default     = "35.235.240.0/20"
}

variable "icmp_firewall_name" {
  description = "Name of the firewall rule allowing ICMP traffic"
  type        = string
  default     = "dev-managenet-allow-icmp"
}

variable "icmp_source_range" {
  description = "Source range allowed to send ICMP traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_firewall_name" {
  description = "Name of the firewall rule allowing HTTP traffic"
  type        = string
  default     = "allow-http-traffic"
}

variable "http_source_range" {
  description = "Source range allowed to send HTTP traffic"
  type        = string
  default     = "0.0.0.0/0"
}

variable "http_target_tag" {
  description = "Network tag for instances that receive HTTP traffic"
  type        = string
  default     = "http-server"
}

variable "http_firewall_ports" {
  description = "TCP ports allowed by the HTTP firewall rule"
  type        = list(string)
  default     = ["80", "443"]
}

variable "vm_name" {
  description = "Name of the development virtual machine"
  type        = string
  default     = "dev-vm-1"
}

variable "vm_machine_type" {
  description = "Machine type for the development virtual machine"
  type        = string
  default     = "e2-micro"
}

variable "vm_zone" {
  description = "Zone for the development virtual machine"
  type        = string
  default     = "us-east1-b"
}

variable "vm_boot_image" {
  description = "Boot disk image for the development virtual machine"
  type        = string
  default     = "debian-cloud/debian-12"
}

variable "dev_webserver_name" {
  description = "Name of the development web server instance"
  type        = string
  default     = "dev-webserver1"
}

variable "dev_webserver_startup_script" {
  description = "Startup script that installs Apache on the development web server"
  type        = string
  default     = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install apache2 -y
    echo "Hello World from us-east1 dev-webserver1" | tee /var/www/html/index.html
    systemctl restart apache2
  EOT
}

variable "prod_webserver_name" {
  description = "Name of the production web server instance"
  type        = string
  default     = "prod-webserver2"
}

variable "prod_webserver_startup_script" {
  description = "Startup script that installs Apache on the production web server"
  type        = string
  default     = <<-EOT
    #!/bin/bash
    apt-get update
    apt-get install apache2 -y
    echo "Hello World from us-central1-a prod-webserver2" | tee /var/www/html/index.html
    systemctl restart apache2
  EOT
}

variable "prod_vm_1_name" {
  description = "Name of the first production virtual machine"
  type        = string
  default     = "prod-vm-1"
}

variable "prod_vm_machine_type" {
  description = "Machine type for the production virtual machines"
  type        = string
  default     = "e2-micro"
}

variable "prod_vm_zone" {
  description = "Zone for the production virtual machines"
  type        = string
  default     = "us-central1-a"
}

variable "prod_vm_boot_image" {
  description = "Boot disk image for the production virtual machines"
  type        = string
  default     = "debian-cloud/debian-12"
}
