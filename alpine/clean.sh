#!/bin/bash

source variables.sh

# clean in reverse order
chmod -x build.sh

rm "Dockerfile"
rm -rf "$SRC"
rm "$HASH_FILE"
rm "$TAR_FILE"
