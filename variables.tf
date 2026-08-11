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
  default     = "default"
}

