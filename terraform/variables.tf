variable "project" {
  description = "Your GCP Project ID"
  type        = string
}

variable "credentials" {
  default = "google_credentials.json"
}

variable "region" {
  description = "Your project region"
  default     = "us-west4"
  type        = string
}

variable "zone" {
  description = "Your project zone"
  default     = "us-west4-c"
  type        = string
}

variable "storage_class" {
  description = "Storage class type for your bucket"
  default     = "STANDARD"
  type        = string
}

variable "vm_image" {
  description = "Image for you VM"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
  type        = string
}

variable "network" {
  description = "Network for your instance/cluster"
  default     = "default"
  type        = string
}

variable "stg_bq_dataset" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default     = "beatlytica_stg"
  type        = string
}

variable "prod_bq_dataset" {
  description = "Storage class type for your bucket. Check official docs for more info."
  default     = "beatlytica_prod"
  type        = string
}

variable "bucket" {
  description = "The name of your bucket. This should be unique across GCP"
  type        = string
}