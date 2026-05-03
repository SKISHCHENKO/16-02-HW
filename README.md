# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

## Задание 1

1.Возьмите из демонстрации к лекции готовый код для создания с помощью двух вызовов remote-модуля -> двух ВМ, относящихся к разным проектам(marketing и analytics) используйте labels для обозначения принадлежности. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} . Воспользуйтесь примером. Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.  
2.Добавьте в файл cloud-init.yml установку nginx.  
3.Предоставьте скриншот подключения к консоли и вывод команды sudo nginx -t, скриншот консоли ВМ yandex cloud с их метками. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.marketing_vm  

## Решение 1

1. Создана новая ветка `terraform-04`.
2. Код из демонстрации к лекции адаптирован под два вызова remote-модуля `git::https://github.com/udjin10/yandex_compute_instance.git?ref=main`.
3. Созданы две виртуальные машины:
   - `marketing-vm-0`, проект `marketing`;
   - `analytics-vm-0`, проект `analytics`.
4. Для обозначения принадлежности ВМ к проектам добавлены `labels`:
   - `project = "marketing"`;
   - `project = "analytics"`.
5. В `cloud-init.yml` SSH-ключ передаётся через переменную `${ssh_public_key}`, а не хранится хардкодом.
6. В `cloud-init.yml` добавлена установка и запуск `nginx`.


### Передача SSH-ключа в cloud-init через template_file

```hcl
data "template_file" "cloudinit" {
  template = file("${path.module}/cloud-init.yml")

  vars = {
    instance_user  = var.instance_user
    ssh_public_key = var.ssh_public_key
  }
}
```

### Фрагмент cloud-init.yml

```yaml
#cloud-config
users:
  - name: ${instance_user}
    groups: [sudo]
    shell: /bin/bash
    sudo: ["ALL=(ALL) NOPASSWD:ALL"]
    ssh-authorized-keys:
      - ${ssh_public_key}

package_update: true
package_upgrade: false
packages:
  - nginx

runcmd:
  - systemctl enable nginx
  - systemctl restart nginx
```

### Метки ВМ marketing

```hcl
labels = {
  owner       = var.owner
  environment = var.env_name
  project     = "marketing"
}
```

### Метки ВМ analytics

```hcl
labels = {
  owner       = var.owner
  environment = var.env_name
  project     = "analytics"
}
```

## Скриншоты

### 1. Подключение к marketing VM и проверка nginx

![Подключение к marketing VM и nginx -t](img/04/task1_1.png)

### 2. Подключение к analytics VM и проверка nginx

![Подключение к analytics VM и nginx -t](img/04/task1_2.png)

### 3. ВМ в консоли Yandex Cloud с меткой project=marketing

![Yandex Cloud marketing labels](img/04/task1_3.png)

### 4. ВМ в консоли Yandex Cloud с меткой project=analytics

![Yandex Cloud analytics labels](img/04/task1_4.png)

### 5. Terraform console: module.marketing_vm

![Terraform console module.marketing_vm](img/04/task1_5.png)

### 6. Terraform console: module.analytics_vm

![Terraform console module.analytics_vm](img/04/task1_6.png)

### 7. Terraform console: отдельно labels

![Terraform console](img/04/task1_7.png)

---
