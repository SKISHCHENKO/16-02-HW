resource "yandex_vpc_network" "develop" {
  name = "${var.env_name}-network"
}

resource "yandex_vpc_subnet" "develop_a" {
  name           = "${var.env_name}-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet_a_cidr]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "${var.env_name}-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.subnet_b_cidr]
}

resource "yandex_vpc_security_group" "vm_sg" {
  name       = "${var.env_name}-vm-sg"
  network_id = yandex_vpc_network.develop.id

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
