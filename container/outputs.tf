output "container_name" {
  value       = docker_container.nodered_container[*].name
  description = "Name of container"
}
output "container_ip_address" {
  value       = [for i in docker_container.nodered_container[*] : join(":", [i.ip_address], i.ports[*]["external"])]
  description = "The IP address of the container"
}
