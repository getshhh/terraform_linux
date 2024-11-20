resource "docker_network" "net_10" {
  name = "net_10"
  driver = "bridge"
  ipam_config {
    gateway = "10.10.0.1"
    subnet = "10.10.0.0/24"
  }
 }

resource "docker_container" "nginx" {
  name = var.container_name
  image = var.container_image
  ports {
    external = 8080
    internal = 80
  }
  networks_advanced {
    name = "net_10"
    ipv4_address = "10.10.0.10"
    
  }
  depends_on =  [docker_network.net_10]
}
output "container_ip" {
  value = docker_container.nginx.network_data[0].ip_address
  
}
