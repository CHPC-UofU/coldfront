# syntax=docker/dockerfile:1
FROM python:3.6

# Docker container environmental variables:
ENV DEBUG=True

# Package installs/updates:
RUN apt-get update && \
    apt-get install -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

# Prepare entrypoint:
COPY ./docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

# Install Python libraries:
WORKDIR /tmp
COPY requirements.txt ./
RUN pip3 install -r requirements.txt && \
    rm requirements.txt

# Change working directory:
WORKDIR /usr/src/app

# Ports:
EXPOSE 8000

# Volumes
VOLUME [ "/usr/src/app" ]

# Run once the container has started:
ENTRYPOINT [ "/docker-entrypoint.sh" ]