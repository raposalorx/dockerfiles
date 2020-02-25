#!/bin/bash

source variables.sh

printf '\nBuilding docker image.\n'
docker build . -t fulsome/"$NAME:$VERSION.$PATCH_VERSION" -t fulsome/"$NAME:$VERSION"

if [ $? == 0 ]
then
  SIZE=$(docker images | grep -P 'fulsome/'"$NAME"'\s*'"$VERSION.$PATCH_VERSION" | grep -oP '\d*\.?\d*(k|M|G)B')
  printf '\nBuilt image at fulsome/%s:%s\n' "$NAME" "$VERSION.$PATCH_VERSION"
  printf 'with a size of %s\n' "$SIZE"
else
  exit 1
fi
