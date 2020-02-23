# Alpine linux base with openrc for services.

Add your services with
```
RUN rc-update add service default
```

Don't set the CMD. But if you do set it as
```
CMD ["/sbin/init"]
```

#Depends
This image depends on fulsome/alpine
