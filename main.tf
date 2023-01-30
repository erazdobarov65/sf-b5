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
