## Quick reference
- **Image based on**:   
  [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [grmvoid](https://github.com/grmvoid)

- **Where to file issues**:    
  [https://github.com/grmvoid/docker-redis/issues](https://github.com/grmvoid/docker-redis/issues?q=)

## Supported tags and respective `Dockerfile` links

- [`7.4.1`, `7.4`](https://github.com/grmvoid/docker-redis/blob/master/7.4/Dockerfile)
- [`7.2.6`, `7.2`](https://github.com/grmvoid/docker-redis/blob/master/7.2/Dockerfile)

## How to use this image

### start a redis instance

```console
$ docker run --name redis -d grmvoid/redis:7.4.1
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `redis`:

```yaml
version: '3.1'

services:
    redis:
        image: grmvoid/redis:7.4.1
        restart: always
        ports:
            - "6379:6379"
```

## License

View [license](https://redis.io/docs/about/license/) information for the software contained in this image.
