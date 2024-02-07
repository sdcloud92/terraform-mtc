variable "ext_port" {
  default = 1880
  type    = number
}

variable "int_port" {
  default = 1880
  type    = number
}

variable "container_count" {
  default = 1
  type    = number
}

variable "random_string_count" {
  default = 1
  type    = number
}

variable "random_string_length" {
  default = 4
  type    = number
}

variable "container_name" {
  default = "nodered"
  type    = string
}
