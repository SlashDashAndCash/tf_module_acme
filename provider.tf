terraform {
  required_providers {
    acme = {
      source = "vancluever/acme"
    }
  }
}

provider "acme" {
  server_url = var.acme_server
}

provider "random" {}
