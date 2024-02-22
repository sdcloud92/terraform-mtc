resource "null_resource" "docker_volume" {
  provisioner "local-exec" {
    command = "mkdir noderedvol/ || true && sudo chown -R 1000:1000 noderedvol/"
  }
}

# Find the latest nodered precise image.
module "image" {
  source   = "./image"
  image_in = var.image[terraform.workspace]
}

resource "random_string" "random" {
  count   = local.container_count
  length  = var.random_string_length
  special = false
  upper   = false
}

# Start a container
module "container" {
  source            = "./container"
  depends_on        = [null_resource.docker_volume]
  count             = local.container_count
  name_in           = join("-", [var.container_name, terraform.workspace, random_string.random[count.index].id])
  image_in          = module.image.image_output
  int_port_in       = var.int_port
  ext_port_in       = var.ext_port[terraform.workspace][count.index]
  container_path_in = "/data"
  host_path_in      = "${path.cwd}/noderedvol"
}




