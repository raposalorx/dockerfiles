NAME=multirun
VERSION=3.5
PATCH_VERSION=3
ARCH="x86_64"

EXTRACT_CMD='tar -xzf'
HASH_CMD='sha256sum'

SRC=multirun
SRC_FILE=multirun-musl-1.0.0.tar.gz
HASH_FILE=sha256sum.txt

BASE_URL="https://github.com/nicolas-van/multirun/releases/download/1.0.0/"
SRC_URL=$BASE_URL$SRC_FILE
HASH_URL=$BASE_URL$HASH_FILE
