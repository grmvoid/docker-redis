# redis

## Quick reference
- **Image based on**:   
  [alpine](https://hub.docker.com/_/alpine)

- **Supported architectures**:    
  `linux/amd64`, `linux/arm64`

- **Maintained by**:  
  [sxbrsky](https://github.com/sxbrsky)

- **Where to file issues**:    
  [https://github.com/sxbrsky/docker-redis/issues](https://github.com/sxbrsky/docker-redis/issues?q=)

## Supported tags and respective Dockerfile links

[`All supported tags see here`](https://hub.docker.com/r/sxbrsky/redis/tags)

## How to use this image

### start a redis instance

```console
$ docker run --name redis -d sxbrsky/redis
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `redis`:

```yaml
version: '3.1'

services:
    redis:
        image: sxbrsky/redis:latest
        restart: always
        ports:
            - "6379:6379"
```

## License

View [license](https://redis.io/docs/about/license/) information for the software contained in this image.
