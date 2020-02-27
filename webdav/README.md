# Very simple, very small webdav server
Please use `htpasswd -c webdavpasswd user` to create a login. Config will fail if you don't.

```
docker run -p 9000:80 -v 'data:/data' fulsome/webdav:1.0
```
