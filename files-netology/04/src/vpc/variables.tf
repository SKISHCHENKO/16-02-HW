variable "env_name" {
  description = "Environment name"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "zone" {
  description = "Yandex Cloud zone for subnet"
  type        = string
}

variable "v4_cidr_blocks" {
  description = "IPv4 CIDR blocks for subnet"
  type        = list(string)
}
