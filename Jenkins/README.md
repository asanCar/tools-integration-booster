# Local deploy of Jenkins
The aim of this document is to provide a guide to deploy a local Jenkins provisioned with the required plugins and Pipelines/Jobs to avoid user interaction with the application.

 Jenkins CasC (Configuration-as-Code) plugin in combination with Jenkins Job DSL plugin have been used to configure the initial Jenkins pipeline. You can customize this at [jenkins.yaml](jenkins.yaml). This multi-branch pipeline expects to find a Jenkinsfile at the repository's root folder, which has the pipeline's jobs to execute.

## Prerequisites
Before you can deploy Nexus you need:
- [Docker](https://docs.docker.com/install/#supported-platforms)
- [docker-compose](https://docs.docker.com/compose/install/)

## Deploy 
First you have to setup an environment variable due to running Jenkins inside Docker (Related Issue: https://github.com/jenkinsci/docker/issues/263):

```sh
export DOCKER_GID=$(stat -c '%g' /var/run/docker.sock)
```

Then you have to set the environment variables to connect to your repository through SSH:

```sh
export GIT_SSH_REPOSITORY='ssh://git@your-repository'
export SSH_USERNAME='your-username'
export SSH_PRIVATE_KEY=$(cat ~/.ssh/id_rsa)
# Only if your key needs password
#export SSH_KEY_PASSWORD='your-key'
```

Finally you have to run the following command to up Jenkins:
```sh
docker-compose build && docker-compose up -d
```
> You will have to wait until Jenkins is up and configured. To check if Jenkins is ready you can run `docker ps -a`. Jenkins will be available when **jenkins** container _STATUS_ is "healthy".
## Cleanup
When you finished using Jenkins, if you want to cleanup all data, you have to run from the **docker-compose.yml**'s folder:
```sh
docker-compose down --remove-orphans && \
docker container prune -f && \
docker volume prune -f
```

# Useful documentation

Jenkins CasC (Configuration-as-Code) [Documentation](http://localhost:8180/configuration-as-code/reference) (Only available when Jenkins instance is running)
Jenkins Job DSL plugin: [Documentation](https://github.com/jenkinsci/job-dsl-plugin/wiki), [API](https://jenkinsci.github.io/job-dsl-plugin)

<!-- ## DockerHub
```sh
export DOCKER_USERNAME="my-username"
export DOCKER_PASSWORD="my-password"
``` -->
