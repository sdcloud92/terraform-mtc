variable "ext_port" {
  type = list(any)

  validation {
    condition     = max(var.ext_port...) <= 65535 && min(var.ext_port...) > 0
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
  container_count = length(var.ext_port)
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

