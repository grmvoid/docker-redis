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

- `7.4.1`, `7.4`
- `7.2.6`, `7.2`

## How to use this image

### start a redis instance

```console
$ docker run --name redis -d grmvoid/redis
```

### ... via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `redis`:

```yaml
version: '3.1'

services:
    redis:
        image: grmvoid/redis:latest
        restart: always
        ports:
            - "6379:6379"
```

## License

View [license](https://redis.io/docs/about/license/) information for the software contained in this image.
