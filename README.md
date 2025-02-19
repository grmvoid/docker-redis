# Redis Docker Container Image

A lightweight Redis container image based on Alpine Linux, building with the Clang and LLVM.

## Quick reference
- **Image based on**: [alpine](https://hub.docker.com/_/alpine)
- **Supported architectures**: `linux/amd64`, `linux/arm64`
- **Maintained by**: [grmvoid](https://github.com/grmvoid)
- **Issues**: [https://github.com/grmvoid/docker-redis/issues](https://github.com/grmvoid/docker-redis/issues?q=)

## Usage
### Pull the Image
To get started, pull the specify a version Redis image:
```bash
  docker pull grmvoid/redis:7.4.2
```

### Running a Container
You can run the Redis container interactively using the following command:
```bash
  docker run -it --name redis -v /path/to/app:app grmvoid/redis:7.4.2
```

### Running via [`docker-compose`](https://github.com/docker/compose)
Example `docker-compose.yml` for `redis`:
```yaml
services:
  redis:
    image: grmvoid/redis:7.4.2
    restart: always
    ports:
```

## LICENSE
Starting on March 20th, 2024, Redis follows a dual-licensing model with the choice of the[Redis Source Available License v2 - RSALv2](https://redis.io/legal/rsalv2-agreement/) or the [Server Side Public License v1 - SSPLv1](https://redis.io/legal/server-side-public-license-sspl/). 
Older versions of Redis (<=7.2.4) are licensed under [3-Clause BSD](https://opensource.org/license/bsd-3-clause).

Additionally, the contents of this repository are licensed under the [MIT License](LICENSE).