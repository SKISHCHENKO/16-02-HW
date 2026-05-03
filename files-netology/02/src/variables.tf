### cloud vars

variable "cloud_id" {
  type        = string
  description = "Yandex Cloud ID"
}

variable "folder_id" {
  type        = string
  description = "Yandex Cloud Folder ID"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Default availability zone"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "Subnet CIDR blocks"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network and subnet name"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to Yandex Cloud service account authorized key JSON file"
}

### ssh vars

variable "vms_ssh_public_root_key" {
  type        = string
  description = "Public SSH key for VM user ubuntu"
}
