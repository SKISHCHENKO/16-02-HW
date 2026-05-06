output "marketing_vm_public_ip" {
  description = "Public IP of marketing VM"
  value       = module.marketing_vm.external_ip_address[0]
}

output "analytics_vm_public_ip" {
  description = "Public IP of analytics VM"
  value       = module.analytics_vm.external_ip_address[0]
}

output "marketing_vm_fqdn" {
  description = "FQDN of marketing VM"
  value       = module.marketing_vm.fqdn[0]
}

output "analytics_vm_fqdn" {
  description = "FQDN of analytics VM"
  value       = module.analytics_vm.fqdn[0]
}

output "marketing_vm_labels" {
  description = "Labels of marketing VM"
  value       = module.marketing_vm.labels[0]
}

output "analytics_vm_labels" {
  description = "Labels of analytics VM"
  value       = module.analytics_vm.labels[0]
}

output "module_marketing_vm" {
  description = "Full marketing module outputs for checking in terraform console/output"
  value       = module.marketing_vm
}

output "module_analytics_vm" {
  description = "Full analytics module outputs for checking in terraform console/output"
  value       = module.analytics_vm
}
output "vpc_dev" {
  description = "VPC module output"
  value       = module.vpc_dev
}

output "vpc_dev_subnet" {
  description = "Subnet information from VPC module"
  value       = module.vpc_dev.subnet
}
