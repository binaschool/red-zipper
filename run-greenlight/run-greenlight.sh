#!/usr/bin/env bash

set -e

echo $GITHUB_TOKEN | docker login https://docker.pkg.github.com -u $GITHUB_USER --password-stdin

docker run --name greenlight-nginx -v $PWD/greenlight.nginx:/etc/nginx/nginx.conf:ro -d nginx
docker-compose up
