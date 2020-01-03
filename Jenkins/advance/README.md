# Documentation

[Documentation](http://localhost:8180/configuration-as-code/reference) (Only available when Jenkins instance is running)


# Credentials 
## SSH
```sh
export SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)
```
## DockerHub
```sh
export DOCKER_USERNAME="my-username"
export DOCKER_PASSWORD="my-password"
```
# Run 
```sh
docker-compose build && docker-compose up -d
```

# Stop
```sh
docker-compose down --remove-orphans && \
docker container prune -f && \
docker volume prune -f
```

# Docker group workarround
> Related Issue: https://github.com/jenkinsci/docker/issues/263
```sh
export DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
```