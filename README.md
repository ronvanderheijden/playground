# Playground
A very simple boilerplate application that uses nginx, php and a mysql database.

```sh
# copy env file
cp -n .env{.example,}
```

```sh
Usage:
  make <target>

Recognized targets:
  help                Print help for each target

DOCKER
  docker-up           (up) Start Docker containers
  docker-down         (down) Stop Docker containers
  docker-run          (run) Login to the php container
  docker-logs         (logs) View logs of containers

COMPOSER
  composer-outdated   (outdated) List outdated composer packages
  composer-update     (update) Update composer packages
```

```sh
# test
curl localhost
```
