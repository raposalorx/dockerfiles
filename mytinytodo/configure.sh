#!/bin/bash

source variables.sh

printf '\nChecking sources...\n'
if [ -f "$SRC_FILE" ]
then
  printf 'Source file already exists.\n'
else
  printf 'Downloading source file...\n'
  wget "$SRC_URL"
  if [ ! -f "$SRC_FILE" ]
  then
    exit 1
  fi
fi

printf '\nUnpacking...\n'
if [ -d "$SRC" ]
then
  printf 'Directory %s already exists, not unpacking.\n' "$SRC"
else
  tar -xzf "$SRC_FILE"
fi

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
SRC=$SRC \
FROM_VERSION=$FROM_VERSION \
envsubst '$SRC $FROM_VERSION' < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
