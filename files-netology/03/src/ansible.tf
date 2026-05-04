resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tftpl", {
    webservers = [
      for vm in yandex_compute_instance.web : {
        name        = vm.name
        external_ip = vm.network_interface[0].nat_ip_address
        fqdn        = vm.fqdn
      }
    ]

    databases = [
      for vm_key, vm in yandex_compute_instance.db : {
        name        = vm_key
        external_ip = vm.network_interface[0].nat_ip_address
        fqdn        = vm.fqdn
      }
    ]

    storage = [
      {
        name        = yandex_compute_instance.storage.name
        external_ip = yandex_compute_instance.storage.network_interface[0].nat_ip_address
        fqdn        = yandex_compute_instance.storage.fqdn
      }
    ]
  })

  filename = "${path.module}/inventory.ini"
}
