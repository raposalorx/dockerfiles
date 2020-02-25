#!/bin/bash

for i in *
do
  if [ -d "$i" ]
  then
    cd "$i" || exit 1
    pwd
    printf 'Cleaning...\n'
    ./clean.sh
    printf '\n\n'
    cd ..
  fi
done
