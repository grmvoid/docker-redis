# Redis Docker Container Images

## Supported tags and respective Dockerfile links
- [`7.2`, `7.2.4`, `latest`](https://github.com/nuldark/docker-redis/blob/master/7.2/Dockerfile)

## Quick reference
- **Image based on**:   
  [alpine:edge](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [nuldark](https://github.com/nulldark)

- **Where to file issues**:    
  [https://github.com/nuldark/docker-redis/issues](https://github.com/nuldark/docker-redis/issues?q=)

## How to use this image

### start a redis instance

```console
$ docker run --name redis -d redis
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `redis`:

```yaml
version: '3.1'

services:
    redis:
        image: nulldark/redis:latest
        restart: always
        ports:
            - "6379:6379"
```

## License

View [license](https://redis.io/docs/about/license/) information for the software contained in this image.
