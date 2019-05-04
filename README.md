[![Build Status](https://travis-ci.com/tossp/teaweb-build.svg?branch=master)](https://travis-ci.com/tossp/teaweb-build)

### docker使用说明

以`docker-compose.yml`文件为例
```
mkdir storage
docker network create ts_net
touch docker-compose.yml
```

```yaml
version: '3'

services:
 teaweb:
  image: tossp/teaweb
  container_name: teaweb
  volumes:
    - ./storage/backups:/teaweb/backups
    - ./storage/configs:/teaweb/configs
    - ./storage/logs:/teaweb/logs
    - ./_VHS:/VHS
  expose:
    - "80"
    - "443"
    - "7777"
  ports:
    - "80:80"
    - "443:443"
    - "7777:7777"
  networks:
    - tsnet
 # healthcheck:
  #  test: ["CMD-SHELL", "/usr/bin/wget --quiet --tries=1 --spider http://localhost/ || exit 1"]
  restart: on-failure


networks:
  tsnet:
    external:
      name: ts_net
```
