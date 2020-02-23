#!/bin/bash

source variables.sh

printf '\nBuilding docker image.\n'
docker build . -t fulsome/alpine:"$VERSION.$PATCH_VERSION"

if [ $? == 0 ]
then
  SIZE=$(docker images | grep -P 'fulsome/alpine\s*3.11.3' | grep -oP '\d*\.?\d*(k|M|G)B')
  printf '\nBuilt image at fulsome/alpine:%s\n' "$VERSION.$PATCH_VERSION"
  printf 'with a size of %s\n' "$SIZE"
else
  exit 1
fi
