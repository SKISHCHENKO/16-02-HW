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
  default     = "develop-03"
  description = "VPC network and subnet name"
}

variable "service_account_key_file" {
  type        = string
  description = "Path to Yandex Cloud service account authorized key JSON file"
}

variable "each_vm" {
  description = "List of database virtual machines"

  type = list(object({
    vm_name     = string
    cpu         = number
    ram         = number
    disk_volume = number
  }))

  default = [
    {
      vm_name     = "main"
      cpu         = 2
      ram         = 2
      disk_volume = 10
    },
    {
      vm_name     = "replica"
      cpu         = 2
      ram         = 4
      disk_volume = 15
    }
  ]
}
