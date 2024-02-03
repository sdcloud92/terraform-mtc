# Find the latest nodered precise image.
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}

resource "random_string" "random" {
  length  = 4
  special = false
}

resource "random_string" "random2" {
  length  = 4
  special = false
}

# Start a container
resource "docker_container" "nodered_container" {
  name  = join("-", ["nodered", random_string.random.id])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}

resource "docker_container" "nodered_container2" {
  name  = join("-", ["nodered", random_string.random2.id])
  image = docker_image.nodered_image.latest
  ports {
    internal = 1880
    # external = 1880
  }
}

