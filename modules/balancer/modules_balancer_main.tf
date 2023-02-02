terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "=0.84"
    }
  }
}

resource "yandex_lb_network_load_balancer" "lb-test" {
  name = "lb-test"

  listener {
    name = "listener-web-servers"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.vm-servers.id

    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

resource "yandex_lb_target_group" "vm-servers" {
  name = "vm-servers-target-group"

  target {
    subnet_id = var.vpc_subnet_id1
    address   = var.internal_ip_address_vm_1
  }

  target {
    subnet_id = var.vpc_subnet_id2
    address   = var.internal_ip_address_vm_2
  }
}

