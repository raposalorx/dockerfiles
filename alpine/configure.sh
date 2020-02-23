#!/bin/bash

source variables.sh

printf '\nChecking sources...\n'
if [ -f "$TAR_FILE" ]
then
  printf 'Source file already exists.\n'
else
  printf 'Downloading source file...\n'
  wget "$SRC_URL"
fi

printf '\nChecking hashes...\n'
if [ -f "$HASH_FILE" ]
then
  printf 'Hash file already exists.\n'
else
  printf 'Downloading hash file...\n'
  wget "$HASH_URL"
fi

printf '\nHashing...\n'
SRC_HASH=$(sha256sum $TAR_FILE)
SHA_HASH=$(cat $HASH_FILE)
if [ "$SRC_HASH" == "$SHA_HASH" ]
then
  printf 'Source file is authentic.\n'
else
  printf 'Source file is not authentic... exiting.\n'
  exit 2
fi

printf '\nUnpacking...\n'
if [ -d "$SRC" ]
then
  printf 'Directory %s already exists, not unpacking.\n' "$SRC"
else
  mkdir "$SRC"
  tar -xzf "$TAR_FILE" -C "$SRC"
fi

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
SRC=$SRC \
envsubst < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
