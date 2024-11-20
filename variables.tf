variable "container_name" {
  type = string 
  description = "Name of Container" 
}

variable "container_image" {
  type = string
  description = "Image of the container"
  default = "nginx:latest"
}
