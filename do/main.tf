terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.26.0"
    }
  }
}

# Create a web server
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-18-04-x64"
  name   = "web"
  region = local.regions.india
  size   =  local.sizes.nano
  user_data = data.template_file.cloud-init-yaml.rendered
}

#output
output "ip_address" {
  value       = digitalocean_droplet.web.ipv4_address
  description = "The public IP address of your droplet."
}
