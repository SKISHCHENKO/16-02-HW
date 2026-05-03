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

### web vm vars

variable "vm_web_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "OS image family for web VM"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Name of the web VM"
}

variable "vm_web_hostname" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "Hostname of the web VM"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Platform ID for the web VM"
}

variable "vm_web_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the web VM"
}

variable "vm_web_memory" {
  type        = number
  default     = 2
  description = "Memory size in GB for the web VM"
}

variable "vm_web_core_fraction" {
  type        = number
  default     = 5
  description = "Guaranteed vCPU performance fraction for the web VM"
}

variable "vm_web_preemptible" {
  type        = bool
  default     = true
  description = "Use preemptible web VM"
}

variable "vm_web_nat" {
  type        = bool
  default     = true
  description = "Enable public NAT IP for web VM"
}

variable "vm_web_serial_port_enable" {
  type        = number
  default     = 1
  description = "Enable serial port for web VM"
}
