# Mojo playgroud

Experimenting with the [Mojo](https://www.modular.com/mojo) 🔥 programming language.

![Made with VHS](https://vhs.charm.sh/vhs-4fdERQG90KpXez41EtyvnR.gif)

## Requirements

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)
- [direnv](https://direnv.net/)
- [Modular](https://modular.com/)

## Setup

- Copy [`.envrc.template`](./.envrc.template) to `.envrc` and set the `MODULAR_AUTH` environment variable to a valid Modular auth token.

You can get a Modular auth token by logging into [Modular](https://developer.modular.com/signup).

```bash
# Build the docker image
docker-compose build

# Create the container
docker-compose up -d

# Enter the container
docker-compose exec mojo bash
```
