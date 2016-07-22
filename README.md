# Docker Swarm Mode (>= Docker 1.12)

This docker cluster is running on Docker Swarm (new 1.12 mode).

## Requirements

You'll need:

- terraform >= v0.6.15
- the `./keys/docker-demo` private key
- a populated `terraform.tfvars` file

## Setup

    make apply

### Manual Swarm Configuration

Initialize the swarm on the first manager:

    docker swarm  init --secret <secret>

Leave the Swarm:
    docker swarm  leave --force

Join a member to the Swarm:

    docker swarm join --secret <secret> (--ca-hash sha256:<hash>) <master-ip>:2377

## Troubleshooting

## Known Bugs
