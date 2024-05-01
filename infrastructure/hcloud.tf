variable "HCLOUD_TOKEN" {
  sensitive = true
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.HCLOUD_TOKEN
}

# Create a server
resource "hcloud_server" "foss" {
  name        = "foss"
  image       = "debian-12"
  server_type = "cx11"
  datacenter  = "nbg1-dc3"
  ssh_keys    = ["16754374"]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
}

# List SSH keys
# data "hcloud_ssh_keys" "all_keys" {
# }
