data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    instance_user  = var.instance_user
    ssh_public_key = var.ssh_public_key
  }
}

module "marketing_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name       = "marketing"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "vm"
  instance_count = 1

  image_family           = var.image_family
  platform               = var.vm_platform_id
  instance_cores         = 2
  instance_memory        = 1
  instance_core_fraction = 20
  boot_disk_size         = 10
  public_ip              = true
  security_group_ids     = [yandex_vpc_security_group.vm_sg.id]

  labels = {
    owner       = var.owner
    environment = var.env_name
    project     = "marketing"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = "1"
  }
}

module "analytics_vm" {
  source = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"

  env_name       = "analytics"
  network_id     = module.vpc_dev.network_id
  subnet_zones   = [module.vpc_dev.subnet_zone]
  subnet_ids     = [module.vpc_dev.subnet_id]
  instance_name  = "vm"
  instance_count = 1

  image_family           = var.image_family
  platform               = var.vm_platform_id
  instance_cores         = 2
  instance_memory        = 1
  instance_core_fraction = 20
  boot_disk_size         = 10
  public_ip              = true
  security_group_ids     = [yandex_vpc_security_group.vm_sg.id]

  labels = {
    owner       = var.owner
    environment = var.env_name
    project     = "analytics"
  }

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = "1"
  }
}
