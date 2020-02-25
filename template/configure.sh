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

printf '\nHashing...\n'
SRC_HASH=$($HASH_CMD "$SRC_FILE")
SHA_HASH=$(cat "$HASH_FILE")
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
  $EXTRACT_CMD "$SRC_FILE" -C "$SRC"
fi

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
SRC=$SRC \
envsubst '$SRC' < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
