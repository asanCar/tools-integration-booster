FROM python:3.6.9-slim

WORKDIR /opt

# Copy scripts
COPY ./provision.sh .
COPY ./utils .
COPY ./docker-registry.groovy .

# Install dependecies
RUN apt-get update -y
RUN apt-get install curl -y

# Run scripts
RUN python json-converter.py