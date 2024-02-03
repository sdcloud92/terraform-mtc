output "container_ip_address" {
  value       = join(":", [docker_container.nodered_container.ip_address, docker_container.nodered_container.ports[0].external])
  description = "The IP address of the container"
}

output "container_name" {
  value       = docker_container.nodered_container.name
  description = "Name of container"
}

output "container_ip_address2" {
  value       = join(":", [docker_container.nodered_container2.ip_address, docker_container.nodered_container2.ports[0].external])
  description = "The IP address of the container"
}

output "container_name2" {
  value       = docker_container.nodered_container2.name
  description = "Name of container"
}