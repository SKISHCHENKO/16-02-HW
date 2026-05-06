output "network_id" {
  description = "VPC network ID"
  value       = yandex_vpc_network.this.id
}

output "network_name" {
  description = "VPC network name"
  value       = yandex_vpc_network.this.name
}

output "subnet" {
  description = "Full information about created subnet"
  value       = yandex_vpc_subnet.this
}

output "subnet_id" {
  description = "Subnet ID"
  value       = yandex_vpc_subnet.this.id
}

output "subnet_zone" {
  description = "Subnet zone"
  value       = yandex_vpc_subnet.this.zone
}

output "subnet_v4_cidr_blocks" {
  description = "Subnet IPv4 CIDR blocks"
  value       = yandex_vpc_subnet.this.v4_cidr_blocks
}
