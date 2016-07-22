output "Docker Swarm Manager(s) Public IPs" {
  value = "${join("\n               ", formatlist("%s", split(",", digitalocean_droplet.swarm_manager.*.ipv4_address)))}"
}

output "Docker Swarm Node(s) Public IPs" {
  value = "${join("\n               ", formatlist("%s", split(",", digitalocean_droplet.swarm_node.*.ipv4_address)))}"
}
