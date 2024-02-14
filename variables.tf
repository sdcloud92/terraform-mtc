variable "env" {
  type        = string
  description = "Env to deploy to"
  default     = "dev"
}

variable "image" {
  type        = map(any)
  description = "image for container"
  default = {
    dev  = "nodered/node-red:latest"
    prod = "nodered/node-red:latest-minimal"
  }
}

variable "ext_port" {
  type = map(any)

  validation {
    condition     = max(var.ext_port["dev"]...) <= 65535 && min(var.ext_port["dev"]...) >= 1980
    error_message = "The port must be within the valid port range of 0 and 1880"
  }
  
    validation {
    condition     = max(var.ext_port["prod"]...) <= 1980 && min(var.ext_port["prod"]...) >= 1880
    error_message = "The port must be within the valid port range of 0 and 1880"
  }
}

variable "int_port" {
  type    = number
  default = 1880

  validation {
    condition     = var.int_port == 1880
    error_message = "Internal port must be 1880"
  }
}

locals {
  container_count = length(lookup(var.ext_port, var.env))
}

variable "random_string_count" {
  type    = number
  default = 3
}

variable "random_string_length" {
  type    = number
  default = 4
}

variable "container_name" {
  type    = string
  default = "nodered"
}

