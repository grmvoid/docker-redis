FROM alpine:edge

LABEL org.opencontainers.image.url="https://github.com/nulldark/redis"
LABEL org.opencontainers.image.source=https://github.com/nulldark/redis
LABEL org.opencontainers.image.title="redis"
LABEL org.opencontainers.image.base.name="docker.io/library/alpine:edge"
LABEL org.opencontainers.image.licenses=MIT

ENV REDIS_VERSION 7.2.4

RUN set -eux; \
      addgroup -S -g 1000 redis; \
      adduser -S -G redis -u 999 redis; \
    \
    apk add --no-cache --virtual .build-deps \
      wget \
      clang \
      llvm \
      make; \
    \
    wget -O redis.tar.gz https://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz; \
    mkdir -p /usr/src/redis; \
    tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
    rm redis.tar.gz; \
    \
    make -C /usr/src/redis -j "$(nproc)" CC=clang CXX=clang++ V=99 REDIS_CFLAGS="-Werror=implicit-function-declaration -flto"; \
    make -C /usr/src/redis install; \
    \
    rm -r /usr/src/redis; \
      runDeps="$( \
    		scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
    			| tr ',' '\n' \
    			| sort -u \
    			| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
    	)"; \
    apk add --no-network --virtual .redis-rundeps $runDeps; \
    apk del --no-network .build-deps; \
    \
    redis-cli --version; \
    redis-server --version; \
    \
    mkdir /data && chown redis:redis /data;

VOLUME /data
WORKDIR /data

EXPOSE 6379
CMD ["redis-server"]