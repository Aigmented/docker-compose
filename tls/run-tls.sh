#!/usr/bin/env bash
set -xe

# Build container image for generating cert material
DOCKER_BUILDKIT=1 docker build -t temporal_tls:test -f ${PWD}/tls/Dockerfile.tls .
mkdir -p .pki

# Run container to name volume and copy out CA certificate
docker run --rm -v temporal_tls_pki:/pki -v ${PWD}/.pki:/pki-out temporal_tls:test
