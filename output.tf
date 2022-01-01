output "private_key_pem" {
  value     = acme_certificate.certificate.private_key_pem
  sensitive = true
}

output "certificate_pem" {
  value = acme_certificate.certificate.certificate_pem
}

output "issuer_pem" {
  value = acme_certificate.certificate.issuer_pem
}

output "fullchain_pem" {
  value = join("\n\n", [acme_certificate.certificate.certificate_pem, acme_certificate.certificate.issuer_pem])
}

output "certificate_p12" {
  value     = acme_certificate.certificate.certificate_p12
  sensitive = true
}

output "certificate_p12_password" {
  value     = acme_certificate.certificate.certificate_p12_password
  sensitive = true
}
