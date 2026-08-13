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

variable "instance_name" {
  description = "Name for the compute instance"
  type        = string
  default     = "terraform-vm-1"
}

variable "machine_type" {
  description = "Machine type for the instance"
  type        = string
  default     = "e2-micro"
}

variable "tags" {
  description = "Network tags to apply to the instance"
  type        = list(string)
  default     = ["web", "dev"]
}

variable "image" {
  description = "Boot disk image for the instance"
  type        = string
  default     = "debian-cloud/debian-12"
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
  default     = "10.0.1.0/24"
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

variable "secondary_subnet_name" {
  description = "Name of the secondary subnet"
  type        = string
  default     = "secondary-subnet"
}

variable "secondary_subnet_cidr" {
  description = "CIDR range for the secondary subnet"
  type        = string
  default     = "10.0.2.0/24"
}
