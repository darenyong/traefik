#!/bin/bash
docker stop traefik
docker rm traefik

docker run -d \
  --privileged \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $PWD/traefik.toml:/traefik.toml \
  -v $PWD/acme.json:/acme.json \
  -v $PWD/.htpasswd:/.htpasswd \
  -p 80:80 \
  -p 443:443 \
  -p 44444:44444 \
  --network proxy \
  --name traefik \
  containous/traefik:latest --docker
