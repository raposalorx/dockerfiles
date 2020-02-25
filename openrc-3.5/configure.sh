#!/bin/bash

source variables.sh

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
VERSION=$VERSION \
PATCH_VERSION=$PATCH_VERSION \
envsubst < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
