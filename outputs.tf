output "container_ip_address" {
  value       = join(":", [docker_container.nodered_container[0].ip_address, docker_container.nodered_container[0].ports[0].external])
  description = "The IP address of the container"
}

output "container_name" {
  value       = docker_container.nodered_container[0].name
  description = "Name of container"
}

output "container_ip_address2" {
  value       = join(":", [docker_container.nodered_container[1].ip_address, docker_container.nodered_container[1].ports[0].external])
  description = "The IP address of the container"
}

output "container_name2" {
  value       = docker_container.nodered_container[1].name
  description = "Name of container"
}