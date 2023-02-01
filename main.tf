terraform {
  required_version = "= 1.4.0"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "= 0.84"
    }
  }
}
provider "yandex" {
  zone      = "ru-central1-a"
  folder_id = var.yandex_folder_id
}

#Создаем новую сеть
resource "yandex_vpc_network" "network" {
  name = "network"
}

#Создаем новую подсеть в зоне А
resource "yandex_vpc_subnet" "subnet1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.0.0/24"]
}

#Создаем новую подсеть в зоне В
resource "yandex_vpc_subnet" "subnet2" {
  name           = "subnet2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.0.0/24"]
}


module "ya_instance_1" {
  source                = "./modules/instance"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet1.id
}

#Создаем новый инстанс в зоне В на базе модуля
module "ya_instance_2" {
  source                = "./modules/instance"
  instance_family_image = "lamp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet2.id
}

#Создаем балансировщик нагрузки на базе модуля
module "lb_test" {
  source                   = "./modules/balancer"
  vpc_subnet_id1           = yandex_vpc_subnet.subnet1.id
  vpc_subnet_id2           = yandex_vpc_subnet.subnet2.id
  internal_ip_address_vm_1 = module.ya_instance_1.internal_ip_address_vm
  internal_ip_address_vm_2 = module.ya_instance_2.internal_ip_address_vm


}