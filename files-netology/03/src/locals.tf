locals {
  ssh_public_key = chomp(file(pathexpand("~/.ssh/id_rsa.pub")))

  vm_metadata = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:${local.ssh_public_key}"
  }
}
