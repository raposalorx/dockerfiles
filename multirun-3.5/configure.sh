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

printf '\nChecking hashes...\n'
if [ -f "$HASH_FILE" ]
then
  printf 'Hash file already exists.\n'
else
  printf 'Downloading hash file...\n'
  wget "$HASH_URL"
  if [ ! -f "$HASH_FILE" ]
  then
    exit 1
  fi
fi

printf 'Please verify hash manually\n'

printf '\nUnpacking...\n'
if [ -d "$SRC" ]
then
  printf 'Directory %s already exists, not unpacking.\n' "$SRC"
else
  mkdir "$SRC"
  $EXTRACT_CMD "$SRC_FILE" -C "$SRC"
fi

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
SRC=$SRC \
VERSION=$VERSION \
PATCH_VERSION=$PATCH_VERSION \
envsubst < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
