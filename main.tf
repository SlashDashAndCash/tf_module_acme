resource "random_password" "p12" {
  length           = 16
  special          = true
  override_special = "_-=+.,"
}


resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = var.email_address
}

resource "acme_certificate" "certificate" {
  account_key_pem           = acme_registration.reg.account_key_pem
  common_name               = var.fqdn
  subject_alternative_names = [var.fqdn]
  certificate_p12_password  = random_password.p12.result
  pre_check_delay           = 120
  recursive_nameservers     = var.recursive_nameservers

  dns_challenge {
    provider = "inwx"

    config = {
      INWX_USERNAME            = var.inwx_username
      INWX_PASSWORD            = var.inwx_password
      INWX_SANDBOX             = false
      INWX_PROPAGATION_TIMEOUT = 300
      INWX_TTL                 = 300
    }
  }
}
