# Find the latest nodered precise image.
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  count   = 2
  length  = 4
  special = false
}

# Start a container
resource "docker_container" "nodered_container" {
  count = 2
  name  = join("-", ["nodered", random_string.random[count.index].id])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}




