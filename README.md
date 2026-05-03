# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»


## Задание 1 

В качестве ответа всегда полностью прикладывайте ваш terraform-код в git. Убедитесь что ваша версия Terraform ~>1.12.0

1.Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.  
2.Создайте сервисный аккаунт и ключ. service_account_key_file.  
3.Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную vms_ssh_public_root_key.  
4.Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.  
5.Подключитесь к консоли ВМ через ssh и выполните команду  curl ifconfig.me. Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: "ssh ubuntu@vm_ip_address". Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: eval $(ssh-agent) && ssh-add Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;  
6.Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.  

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;  
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;  
- ответы на вопросы.  


## Решение 1

Создание ВМ через команды yc

![Задание 1](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task1_1.png)

Скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес: 

![Задание 1](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task1_2.png)

Скриншот консоли, curl должен отобразить тот же внешний ip-адрес;

![Задание 1](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task1_3.png)

В исходном main.tf была намеренно допущена ошибка в названии платформы: было platform_id = "standart-v4". Суть ошибки в опечатке: написано standart вместо standard. Исправлено на platform_id = "standard-v2".  

Также в проекте были проверены переменные provider-блока: cloud_id, folder_id, default_zone и service_account_key_file. Для подключения к ВМ через SSH публичная часть ключа была записана в переменную vms_ssh_public_root_key и добавлена в metadata в формате ubuntu:<public_key>.  

Параметр preemptible = true полезен тем, что создаёт прерываемую ВМ. Такая ВМ дешевле обычной, подходит для временных работ, но может быть остановлена облаком.  

Параметр core_fraction = 5 полезен для экономии ресурсов. Он означает, что ВМ получает 5% гарантированной производительности vCPU. Для учебных задач, SSH, curl и простых проверок Terraform этого достаточно.  


## Задание 2

1.Замените все хардкод-значения для ресурсов yandex_compute_image и yandex_compute_instance на отдельные переменные. К названиям переменных ВМ добавьте в начало префикс vm_web_ . Пример: vm_web_name.  
2.Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их default прежними значениями из main.tf.  
3.Проверьте terraform plan. Изменений быть не должно.  

## Решение 2

Все хардкод-значения из ресурсов yandex_compute_image и yandex_compute_instance были вынесены в отдельные переменные.  
Для первой ВМ добавлены переменные с префиксом vm_web_: vm_web_name, vm_web_hostname, vm_web_platform_id, vm_web_cores, vm_web_memory, vm_web_core_fraction, vm_web_preemptible, vm_web_nat, vm_web_serial_port_enable.  
Для образа добавлена переменная vm_web_image_family.  

Все переменные объявлены в variables.tf с указанием type и default-значений, соответствующих прежним значениям из main.tf.  

После выполнения terraform plan изменений нет: инфраструктура соответствует конфигурации, о чем говорит скриншот:

![Задание 2](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task2_1.png)

## Задание 3

1.Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.  
2.Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: "netology-develop-platform-db" , cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом vm_db_ в том же файле ('vms_platform.tf'). ВМ должна работать в зоне "ru-central1-b"  
3.Примените изменения.  

## Решение 3

Для задания 3 создан файл vms_platform.tf. В него перенесены все переменные первой ВМ с префиксом vm_web_.  

В этот же файл добавлены переменные второй ВМ с префиксом vm_db_: vm_db_name, vm_db_hostname, vm_db_platform_id, vm_db_zone, vm_db_cores, vm_db_memory, vm_db_core_fraction и другие параметры.  

В main.tf добавлен второй ресурс yandex_compute_instance.platform_db для ВМ netology-develop-platform-db. Для размещения ВМ в зоне ru-central1-b также добавлена отдельная подсеть yandex_vpc_subnet.develop_db с CIDR 10.0.2.0/24, потому что подсети в Yandex Cloud являются зональными.  

После terraform apply были созданы новая подсеть и новая ВМ.  

Скриншот проверки yc и terraform state list
![Задание 3](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task3_1.png)

Скриншот ЛК yandex cloud

![Задание 3](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task3_2.png)


## Задание 4

1.Объявите в файле outputs.tf один output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)  
2.Примените изменения.  
В качестве решения приложите вывод значений ip-адресов команды terraform output.

## Решение 4

В файле outputs.tf объявлен один output vms_info. Он содержит данные по двум ВМ: web и db. Для каждой ВМ выводятся instance_name, external_ip и fqdn.  

Значения не захардкожены, а берутся напрямую из ресурсов yandex_compute_instance.platform и yandex_compute_instance.platform_db.  

Скриншоты применения изменений и непосредственно terraform output

![Задание 4](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task4_1.png)

![Задание 4](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task4_2.png)

## Задание 5

1.В файле locals.tf опишите в одном local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.  
2.Замените переменные внутри ресурса ВМ на созданные вами local-переменные.  
3.Примените изменения.  

## Решение 5

В файле locals.tf создан один local-блок. В нём описаны имена обеих ВМ: vm_web_full_name и vm_db_full_name.  

Имена ВМ формируются через интерполяцию из нескольких переменных: var.vm_project, var.vpc_name, var.vm_platform_name, var.vm_web_name и var.vm_db_name.  

В main.tf в ресурсах yandex_compute_instance.platform и yandex_compute_instance.platform_db значения name и hostname заменены на local.vm_web_full_name и local.vm_db_full_name.  

Скриншот выполнения: 

![Задание 5](https://github.com/SKISHCHENKO/16-02-HW/blob/main/img/task5_1.png)

## Задание 6

## Решение 6

В задании 6 отдельные переменные vm_web_cores, vm_web_memory, vm_web_core_fraction, vm_db_cores, vm_db_memory и vm_db_core_fraction были заменены на одну общую map-переменную vms_resources.  

Внутри vms_resources описаны конфигурации для двух ВМ: web и db. В блоках resources теперь используются значения var.vms_resources["web"].cores, var.vms_resources["web"].memory, var.vms_resources["web"].core_fraction и аналогично для db.  

Также создана общая переменная metadata типа map(string), которая используется в обеих ВМ через metadata = var.metadata.  

Неиспользуемые переменные были закомментированы.  
 
После выполнения terraform plan изменений нет: инфраструктура соответствует конфигурации.  