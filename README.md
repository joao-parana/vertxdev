# vertxdev

Oracle Java JDK 8 plus vertx on Ubuntu 14.04.2

This **Dockerfile** is a [trusted build](https://registry.hub.docker.com/u/parana/vertxdev/) of [Docker Registry](https://registry.hub.docker.com/).

### Based on [this post](http://blog.zenika.com/index.php?post/2014/10/07/Setting-up-a-development-environment-using-Docker-and-Vagrant)


### Installation
```
docker pull parana/vertxdev
```

Run with 80 and 22 ports opened:
```
docker run -d  -p 1443:80 -p 49160:22  parana/vertxdev
```

Login by SSH
```
ssh root@$(docker-ip) -p 49160
password: admin
```

Connect via WebBrowser with following setting:
```
hostname: $(docker-ip)
port: 1443

open http://$(docker-ip):1443
```
Define in your .bash_profile this function:

docker-ip() { 
  boot2docker ip 2> /dev/null 
} 
