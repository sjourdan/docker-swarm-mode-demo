# Docker Swarm Mode (>= Docker 1.12)

This docker cluster is running on Docker Swarm (new 1.12 mode). Warning: this was written with a pre-release version of Docker 1.12 - things work differently in the final release. 

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
  * the `--secret` option to `docker swarm join` has been pulled from 1.12 final. A related discussion includes [this issue](https://github.com/docker/docker/issues/24430). Workaround may include playing around (didn't test yet) `MANAGER_JOIN_TOKEN="$(docker swarm join-token -q manager)"` and `MANAGER_JOIN_TOKEN="$(docker swarm join-token -q worker)"`.
