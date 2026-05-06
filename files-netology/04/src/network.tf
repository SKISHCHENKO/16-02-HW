module "vpc_dev" {
  source = "./vpc"

  env_name       = var.env_name
  network_name   = "${var.env_name}-network"
  zone           = var.default_zone
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_security_group" "vm_sg" {
  name       = "${var.env_name}-vm-sg"
  network_id = module.vpc_dev.network_id

  ingress {
    description    = "SSH"
    protocol       = "TCP"
    port           = 22
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description    = "HTTP"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description    = "Allow all outgoing traffic"
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}
