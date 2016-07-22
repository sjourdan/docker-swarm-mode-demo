/* A Docker Swarm Manager */
resource "digitalocean_droplet" "swarm_manager" {
  image              = "${var.do_image}"
  count              = "${var.swarm_manager_nodes}"
  name               = "swarm-manager-${count.index+1}"
  region             = "${var.do_region}"
  size               = "${var.do_droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  private_networking = true

  connection {
    user     = "root"
    key_file = "${var.ssh_key_file}"
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt upgrade -y",
      "curl -fsSL https://test.docker.com/ | sh",
      "docker swarm  init --secret ${var.swarm_token}",
    ]
  }
}

/* As Many Docker Swarm Nodes As Needed */
resource "digitalocean_droplet" "swarm_node" {
  depends_on         = ["digitalocean_droplet.swarm_manager"]
  image              = "${var.do_image}"
  count              = "${var.swarm_nodes}"
  name               = "swarm-node-${count.index+1}"
  region             = "${var.do_region}"
  size               = "${var.do_droplet_size}"
  ssh_keys           = ["${digitalocean_ssh_key.default.id}"]
  private_networking = true

  connection {
    user     = "root"
    key_file = "${var.ssh_key_file}"
  }

  provisioner "remote-exec" {
    inline = [
      "apt update",
      "apt upgrade -y",
      "curl -fsSL https://test.docker.com/ | sh",
      "docker swarm  join --secret ${var.swarm_token} ${digitalocean_droplet.swarm_manager.ipv4_address_private}:2377",
    ]
  }
}
