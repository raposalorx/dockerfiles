#!/bin/bash

source variables.sh

if [ -f webdavpasswd ]
then
  printf '\nPassword configured.\n'
else
  printf '\nPlease create password with `htpasswd -c webdavpasswd user`\n'
  exit 1
fi

printf '\nConfiguring Dockerfile.\n'
# Variables have to be declared on the same line.
SRC=$SRC \
FROM_VERSION=$FROM_VERSION \
envsubst '$SRC $FROM_VERSION' < tmp_Dockerfile > Dockerfile

printf '\nMaking build.sh executable.\n'
chmod +x build.sh
