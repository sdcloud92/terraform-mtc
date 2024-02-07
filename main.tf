# Find the latest nodered precise image.
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = var.random_string_count
  length  = var.random_string_length
  special = false
  upper   = false
}

# Start a container
resource "docker_container" "nodered_container" {
  count = var.container_count
  name  = join("-", [var.container_name, random_string.random[count.index].id])
  image = docker_image.nodered_image.latest
  ports {
    internal = var.int_port
    external = var.ext_port
  }
}




