resource "local_file" "vm_ip" {
  content = google_compute_instance.vm.network_interface[0].access_config[0].nat_ip
  filename = "/home/Akash/vm_public_ip.txt"
}