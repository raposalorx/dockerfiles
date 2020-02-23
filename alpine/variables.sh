NAME=alpine
VERSION=3.11
PATCH_VERSION=3
ARCH="x86_64"

EXTRACT_CMD='tar -xzf'
HASH_CMD='sha256sum'

SRC='alpine-minirootfs-'$VERSION'.'$PATCH_VERSION'-'$ARCH
SRC_FILE='alpine-minirootfs-'$VERSION'.'$PATCH_VERSION'-'$ARCH'.tar.gz'
HASH_FILE=$SRC_FILE'.sha256'

BASE_URL='http://dl-cdn.alpinelinux.org/alpine/v'$VERSION'/releases/'$ARCH'/'
SRC_URL=$BASE_URL$SRC_FILE
HASH_URL=$BASE_URL$HASH_FILE
