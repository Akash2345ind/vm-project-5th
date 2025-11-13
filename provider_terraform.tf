
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