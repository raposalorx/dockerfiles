#!/bin/bash

source variables.sh

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
FROM_VERSION=$FROM_VERSION \
TIMEZONE=$TIMEZONE \
envsubst '$FROM_VERSION $TIMEZONE' < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
