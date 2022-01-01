# Provider
variable "inwx_username" {}
variable "inwx_password" {}

# Let's Encrypt
variable "fqdn" {}
variable "email_address" {}
variable "acme_server" {
  default = "https://acme-staging-v02.api.letsencrypt.org/directory"
}
variable "recursive_nameservers" {
  default = ["8.8.8.8:53", "8.8.4.4:53"]
}
