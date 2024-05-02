terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "~> 1.45"
    }
  }

  cloud {
    organization = "dev-test-org"
    hostname     = "app.terraform.io"

    workspaces {
      name = "github-actions"
    }
  }
}
