variable "project" {
  description = "GCP project ID"
  type        = string
  default     = "gcp-networking-489914"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-east1"
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "us-east1-b"
}

variable "tags" {
  description = "Network tags to apply to the instance"
  type        = list(string)
  default     = ["web", "dev"]
}

variable "network" {
  description = "Network to attach the instance to"
  type        = string
  default     = "managenet" # Default to the VPC created in this configuration
}

# VPC Variables ####################################################
variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
  default     = "managenet"
}

variable "vpc_description" {
  description = "Description of the VPC network"
  type        = string
  default     = "VPC network created with Terraform"
}

variable "prod_network_project" {
  description = "GCP project ID for the production VPC network"
  type        = string
  default     = "gcp-networking-489914"
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

variable "prod_network_auto_create_subnetworks" {
  description = "Whether the production VPC automatically creates subnetworks"
  type        = bool
  default     = false
}

variable "prod_network_routing_mode" {
  description = "Routing mode for the production VPC network"
  type        = string
  default     = "REGIONAL"
}

variable "prod_network_bgp_best_path_selection_mode" {
  description = "BGP best-path selection mode for the production VPC network"
  type        = string
  default     = "LEGACY"
}

variable "prod_ssh_firewall_name" {
  description = "Name of the production SSH firewall rule"
  type        = string
  default     = "prod-managenet-allow-ssh"
}

variable "prod_ssh_firewall_direction" {
  description = "Traffic direction for the production SSH firewall rule"
  type        = string
  default     = "INGRESS"
}

variable "prod_ssh_firewall_priority" {
  description = "Priority of the production SSH firewall rule"
  type        = number
  default     = 1000
}

variable "prod_ssh_firewall_source_ranges" {
  description = "Source IP ranges allowed by the production SSH firewall rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "prod_icmp_firewall_name" {
  description = "Name of the production ICMP firewall rule"
  type        = string
  default     = "prod-managenet-allow-icmp"
}

variable "prod_icmp_firewall_direction" {
  description = "Traffic direction for the production ICMP firewall rule"
  type        = string
  default     = "INGRESS"
}

variable "prod_icmp_firewall_priority" {
  description = "Priority of the production ICMP firewall rule"
  type        = number
  default     = 1000
}

variable "prod_icmp_firewall_source_ranges" {
  description = "Source IP ranges allowed by the production ICMP firewall rule"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "prod_primary_subnet_name" {
  description = "Name of the production primary subnet"
  type        = string
  default     = "prod-primary-subnet"
}

variable "prod_primary_subnet_description" {
  description = "Description of the production primary subnet"
  type        = string
  default     = "Production subnet"
}

variable "prod_primary_subnet_cidr" {
  description = "IPv4 CIDR range for the production primary subnet"
  type        = string
  default     = "30.0.1.0/24"
}

variable "prod_primary_subnet_stack_type" {
  description = "IP stack type for the production primary subnet"
  type        = string
  default     = "IPV4_ONLY"
}

variable "prod_primary_subnet_region" {
  description = "Region for the production primary subnet"
  type        = string
  default     = "us-central1"
}

variable "prod_primary_subnet_private_ip_google_access" {
  description = "Whether Private Google Access is enabled for the production subnet"
  type        = bool
  default     = true
}

variable "prod_primary_subnet_enable_flow_logs" {
  description = "Whether VPC flow logs are enabled for the production subnet"
  type        = bool
  default     = true
}

variable "routing_mode" {
  description = "The network routing mode (REGIONAL or GLOBAL)"
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = contains(["REGIONAL", "GLOBAL"], var.routing_mode)
    error_message = "Routing mode must be either REGIONAL or GLOBAL."
  }
}

variable "primary_subnet_name" {
  description = "Name of the primary subnet"
  type        = string
  default     = "primary-subnet"
}

variable "primary_subnet_cidr" {
  description = "CIDR range for the primary subnet"
  type        = string
  default     = "10.10.1.0/24"
}

variable "private_ip_google_access" {
  description = "Enable Private Google Access on the subnet"
  type        = bool
  default     = true
}

variable "allow_ssh_from" {
  description = "IP ranges allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
