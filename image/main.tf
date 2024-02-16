# Find the latest nodered precise image.
resource "docker_image" "nodered_image" {
  name = "nodered/node-red:latest"
}
