resource "google_compute_instance" "vm" {
    name         = "vm"
    zone         = "us-central1-a"
    machine_type = "e2-medium"
    boot_disk {
        initialize_params {
            image = "projects/ubuntu-os-cloud/global/images/ubuntu-2404-noble-amd64-v20250819"
            size  = 20
            type  = "pd-balanced"
        }
    }
    metadata = {
        enable-osconfig = "TRUE"
        ssh-keys = "Akash:${file("/home/Akash/.ssh/id_rsa.pub")}"
    }
    network_interface {
        access_config {
        }
        subnetwork = "default"
    }
}

provider "google" {
  project = "utopian-nimbus-477714-j0"
  credentials = file("/home/Akash/a.json")
}
terraform {
  required_providers {
    google = {
    }
  }
}