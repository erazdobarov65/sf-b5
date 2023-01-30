terraform {
  required_version = "= 1.4.0"
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "= 0.84"
    }
  }
}
provider "yandex" {
  zone = "ru-central1-a"
  folder_id = var.yandex_folder_id
}
resource "yandex_vpc_network" "network_terraform" {
  name = "network_terraform"
}

resource "yandex_vpc_subnet" "subnet_terraform1" {
  name           = "subnet_tarraform1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.1.0/24"]
}

resource "yandex_vpc_subnet" "subnet_terraform2" {
  name           = "subnet_terraform2"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.1.0/24"]
}


module "vm_test1" {
  source                = "./modules/instance"
  instance_family_image = "lemp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet_terraform1.id
}

module "vm_test2" {
  source                = "./modules/instance"
  instance_family_image = "lamp"
  vpc_subnet_id         = yandex_vpc_subnet.subnet_terraform2.id
}