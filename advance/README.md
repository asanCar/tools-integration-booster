# Advanced local deploy of Nexus
The aim of this document is to provide a way to deploy a local Nexus with a Docker registry accessible via HTTP.

## Prerequisites
Before you can deploy Nexus you need:
- Docker [https://docs.docker.com/install/#supported-platforms]
- docker-compose [https://docs.docker.com/compose/install/]

## Deploy 
```sh
docker-compose build && docker-compose up -d
```
> You will have to wait until Nexus is configured. To check if Nexus is ready you can run `docker ps -a`. Nexus will be available when **nexus** container _STATUS_ is "healthy" and **provisioner** is "exited".

## Login to Docker registry
> Default credentials for Nexus are: *admin/admin123*
```sh
docker login -u admin -p admin123 localhost:8082
```

## Customization

### Change default password
To modify the default password for the **admin** user, modify line 8 from *docker-registry.groovy*:

```groovy
security.securitySystem.changePassword('admin','new_password')
```
