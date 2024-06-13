#!/usr/bin/env bash

set -e

if [[ -z "$1" ]]; then
    tag=latest
else
    tag=$1
fi

podman build -t ghcr.io/jelmer/matrix-alertmanager:${tag} .
podman push ghcr.io/jelmer/matrix-alertmanager:${tag}

if [[ "$tag" == "latest" ]]; then
    exit
fi

podman tag ghcr.io/jelmer/matrix-alertmanager:${tag} ghcr.io/jelmer/matrix-alertmanager:latest
podman push ghcr.io/jelmer/matrix-alertmanager:latest
