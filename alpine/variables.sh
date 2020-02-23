VERSION=3.11
PATCH_VERSION=3
ARCH="x86_64"

SRC='alpine-minirootfs-'$VERSION'.'$PATCH_VERSION'-'$ARCH
TAR_FILE='alpine-minirootfs-'$VERSION'.'$PATCH_VERSION'-'$ARCH'.tar.gz'
HASH_FILE=$TAR_FILE'.sha256'

BASE_URL='http://dl-cdn.alpinelinux.org/alpine/v'$VERSION'/releases/'$ARCH'/'
SRC_URL=$BASE_URL$TAR_FILE
HASH_URL=$BASE_URL$HASH_FILE
