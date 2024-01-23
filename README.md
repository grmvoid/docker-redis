# Redis Docker Container Images

![GitHub release (with filter)](https://img.shields.io/github/v/release/nulldark/redis)

## Supported tags and respective Dockerfile links
- [`7.2`, `7.2.4`, `latest`](https://github.com/nulldark/php/blob/master/Dockerfile)

## Quick reference
- **Image based on**:   
  [alpine:edge](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [nulldark](https://github.com/nulldark)

- **Where to file issues**:    
  [https://github.com/nulldark/redis/issues](https://github.com/nulldark/redis/issues?q=)

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
        image: ghrc.io/nulldark/redis
        restart: always
        ports:
            - "6379:6379"
```

## License

View [license](https://redis.io/docs/about/license/) information for the software contained in this image.
