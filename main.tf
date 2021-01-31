variable do_token {}

terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.3.0"
    }
  }
}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "work" {
  name = "PublicKeyFromMac" # We have to generate from our terminal then put it into DigitalOcean Dashboard.
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "my-new-vm" #Only valid hostname characters are allowed. (a-z, A-Z, 0-9, . and -)
  region = "sgp1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.work.id,
  ]
}

output "server_ip" {
  value = digitalocean_droplet.web.ipv4_address
}

