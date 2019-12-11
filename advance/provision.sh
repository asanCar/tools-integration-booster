#!/usr/bin/env bash
NEXUS_USERNAME=admin
NEXUS_PASSWORD=`cat /data/admin.password`
echo "Upload Groovy Script for Docker Registry creation"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD --header "Content-Type: application/json" 'http://nexus:8081/service/rest/v1/script' -d @/opt/docker-registry.json

echo "Execute Groovy script"
curl -v -X POST -u $NEXUS_USERNAME:$NEXUS_PASSWORD  --header "Content-Type: text/plain" 'http://nexus:8081/service/rest/v1/script/docker-registry/run'
