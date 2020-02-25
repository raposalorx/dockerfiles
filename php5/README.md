# Super minimal image for nginx running php5
`/www` is your working directory.

`USER www` is the default running user.

`CMD ["multirun", "-v", "php-fpm5 -F", "nginx -g 'daemon off;'"]` is the default launch CMD.

The php install is limited to php5-fpm and its dependencies. Add more requirements for your project with `apk add --no-cache php5-fpm`

There is a `phpinfo()` index running by default to test.
