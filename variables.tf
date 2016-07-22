variable "do_token" {
  description = "Digital Ocean Token"
}

variable "ssh_key_file" {
  description = "Default SSH Key file"
}

variable "do_region" {
  default     = "ams3"
  description = "Digital Ocean Region"
}

variable "do_droplet_size" {
  default     = "512mb"
  description = "Droplet Size"
}

variable "do_image" {
  default     = "fedora-23-x64"
  description = "Image Name"
}

variable "swarm_manager_nodes" {
  default     = 1
  description = "Number of manager nodes in the cluster"
}

variable "swarm_nodes" {
  default     = 1
  description = "Number of nodes in the cluster"
}

variable "swarm_token" {
  default     = "12345789"
  description = "A 26 chars Docker Swarm Token"
}
