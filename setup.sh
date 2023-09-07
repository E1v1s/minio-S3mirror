#! /bin/sh

# exit if a command fails
set -e

apk update

#install minio mc
apk add wget
wget https://dl.min.io/client/mc/release/linux-amd64/mc
chmod +x mc
apk del wget

# cleanup
rm -rf /var/cache/apk/*
