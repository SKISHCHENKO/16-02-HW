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

### db vm vars

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Name of the db VM"
}

variable "vm_db_hostname" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "Hostname of the db VM"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v2"
  description = "Platform ID for the db VM"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Availability zone for the db VM"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "CIDR block for db subnet"
}

variable "vm_db_cores" {
  type        = number
  default     = 2
  description = "Number of CPU cores for the db VM"
}

variable "vm_db_memory" {
  type        = number
  default     = 2
  description = "Memory size in GB for the db VM"
}

variable "vm_db_core_fraction" {
  type        = number
  default     = 20
  description = "Guaranteed vCPU performance fraction for the db VM"
}

variable "vm_db_preemptible" {
  type        = bool
  default     = true
  description = "Use preemptible db VM"
}

variable "vm_db_nat" {
  type        = bool
  default     = true
  description = "Enable public NAT IP for db VM"
}

variable "vm_db_serial_port_enable" {
  type        = number
  default     = 1
  description = "Enable serial port for db VM"
}
