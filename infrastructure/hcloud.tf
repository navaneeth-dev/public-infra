variable "hcloud_token" {
  sensitive = true
}

# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token = var.hcloud_token
}

# Create a server
resource "hcloud_server" "foss" {
  name        = "foss"
  image       = "debian-12"
  server_type = "cax11"
  datacenter  = "nbg1-dc3"
  # ssh_keys    = ["16754374"]
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  user_data = <<EOF
#cloud-config
users:
    - name: debian
      sudo: ALL=(ALL) NOPASSWD:ALL
      shell: /bin/bash
      ssh_authorized_keys:
        - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrcIuS2ittBFq/DGNZwjiidvmphuWm/h4dpGpq14iAGyEaG7vmaElcOEIIOhkksFfo6BB+4FErzIuc1jtB4uANWwPZDVhDby6w9g8gW1AS9x4y5RAVmMUCt0mR0zyQKI7njzQSCdJRQK4LZ9OIbvLaslNVB3jPtSwP5f7Q2pWEvGLuNiDqRIdlcbwurTEzlhnaHSB0iOAVZfxyCojBzwiBs+qls05iY3xMtF13L+W3J41PytTu28QUgtGeKBe5Jypu0IKGS3BplMlg5nr3pgLO8J3Zg+67ep3cMrtvHpFvNALB1aFIWWFT09xTKtnGy81+QDiFI8ybe0SAmj/FAoguA9bfAx778z9d9pEYZDeHm/UCyIo3W6h9ME/qcGLRwJGdFgJ0spUIS2QO766ZrPgzcMdBquPhRG7A3A3WNLftrNKvRVjECg2VftPmyTCU1EoNtq7uXyY5Izc/2vcK/G2JeNnK06Ilh+B+RSNfD5hBFv+URj6goWbR4dvnRWRcsINCuKuMN2qDye3cxQ3jkQsyH3mC5ZhuTdiww9l0xFLymT2HJMFSQKuUCFJs2civk8oQ0bCh+gPNPlHKXWshYIx6HN/0GJB2BgubxhVz9tscS8falseR0YGHsv9sHKLsap8rK7wQKsc0ZCvlhUfO0Ur6ZAY8nVeXHGxBeiXc79JK3w== john@DESKTOP-3AGDPBF
        - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAzGh7PXv7AEYfnnNR/gc+GfVvuZaTsUTCAHdvdnoabs
package_update: true
package_upgrade: true
EOF
}

# List SSH keys
# data "hcloud_ssh_keys" "all_keys" {
# }
