FROM redis:alpine

LABEL org.opencontainers.image.url="https://github.com/bytebits9/redis"
LABEL org.opencontainers.image.source=https://github.com/bytebits9/redis
LABEL org.opencontainers.image.title="redis"
LABEL org.opencontainers.image.base.name="docker.io/library/redis:alpine"
LABEL org.opencontainers.image.licenses=MIT

VOLUME "/data"

EXPOSE 6379

CMD [ "redis-server" ]