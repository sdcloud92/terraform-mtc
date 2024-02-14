resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/"
  }
}

# Find the latest nodered precise image.
resource "docker_image" "nodered_image" {
  name = var.image[terraform.workspace]
}

resource "random_string" "random" {
  count   = local.container_count
  length  = var.random_string_length
  special = false
  upper   = false
}

# Start a container
resource "docker_container" "nodered_container" {
  count = local.container_count
  name  = join("-", [var.container_name, terraform.workspace, random_string.random[count.index].id])
  image = docker_image.nodered_image.latest
  ports {
    internal = var.int_port
    external = var.ext_port[terraform.workspace][count.index]
  }
  volumes {
    container_path = "/data"
    host_path      = "${path.cwd}/noderedvol"
  }
}




