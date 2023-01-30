terraform {
       required_providers {
         yandex = {
           source  = "yandex-cloud/yandex"
           version = "=0.84"
         }
       }
}

data "yandex_compute_image" "evgeny_image" {
  family = var.instance_family_image
}

resource "yandex_compute_instance" "vm-test" {
  name = "terraform-${var.instance_family_image}"
  allow_stopping_for_update = true

  resources {
    cores  = 2
    memory = 2
  }

scheduling_policy {
  preemptible = true
}

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id = var.vpc_subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${file("../../meta.yml")}"
  }
}
