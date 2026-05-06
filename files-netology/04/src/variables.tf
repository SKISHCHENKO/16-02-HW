variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Cloud Folder ID"
  type        = string
}

variable "zone" {
  description = "Default Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

# variable "service_account_key_file" {
#   description = "Path to Yandex Cloud service account authorized_key.json"
#   type        = string
#   default     = "./authorized_key.json"
# }

variable "instance_user" {
  description = "Linux user created/configured by cloud-init"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "Public SSH key content, for example: ssh-ed25519 AAAA... user@host"
  type        = string
  sensitive   = true
}

variable "owner" {
  description = "Owner label value"
  type        = string
  default     = "sergk"
}

variable "env_name" {
  description = "Common environment label/name"
  type        = string
  default     = "develop"
}

variable "image_family" {
  description = "Yandex Cloud image family"
  type        = string
  default     = "ubuntu-2204-lts"
}

variable "vm_platform_id" {
  description = "Yandex Cloud VM platform"
  type        = string
  default     = "standard-v3"
}

variable "subnet_a_cidr" {
  description = "CIDR for subnet A"
  type        = string
  default     = "10.10.1.0/24"
}

variable "subnet_b_cidr" {
  description = "CIDR for subnet B"
  type        = string
  default     = "10.10.2.0/24"
}

variable "token" {
  description = "OAuth token for Yandex Cloud"
  type        = string
  sensitive   = true
}

variable "default_zone" {
  description = "Default Yandex Cloud zone"
  type        = string
  default     = "ru-central1-a"
}

variable "default_cidr" {
  description = "Default subnet CIDR blocks"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}
