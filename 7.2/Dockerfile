FROM alpine:3.21

ARG REDIS_VERSION="7.2.6"

LABEL org.opencontainers.image.base.name="docker.io/library/alpine:3.21" \
      org.opencontainers.image.description="Application packaged by grmvoid" \
      org.opencontainers.image.documentation="https://github.com/grmvoid/docker-redis/tree/master/README.md" \
      org.opencontainers.image.licenses="MIT" \
      org.opencontainers.image.ref.name="${REDIS_VERSION}" \
      org.opencontainers.image.source="https://github.com/grmvoid/docker-redis/tree/master/7.2" \
      org.opencontainers.image.title="redis" \
      org.opencontainers.image.vendor="grmvoid" \
      org.opencontainers.image.version="${REDIS_VERSION}"

RUN set -eux; \
    \
      #  add redis user
        addgroup -S -g 1000 redis; \
        adduser -S -G redis -u 999 redis; \
    \
      # install build tools
        apk add --no-cache --virtual .build-deps \
          wget \
          clang \
          llvm \
          make; \
    \
      # get sources
        wget -O redis.tar.gz https://download.redis.io/releases/redis-${REDIS_VERSION}.tar.gz; \
        mkdir -p /usr/src/redis; \
        tar -xzf redis.tar.gz -C /usr/src/redis --strip-components=1; \
        rm redis.tar.gz; \
    \
      # install redis
        make -C /usr/src/redis -j "$(nproc)" CC=clang CXX=clang++ V=99 REDIS_CFLAGS="-Werror=implicit-function-declaration -flto"; \
        make -C /usr/src/redis install; \
    \
      # install deps
        runDeps="$( \
          scanelf --needed --nobanner --format '%n#p' --recursive /usr/local \
    	  | tr ',' '\n' \
    	  | sort -u \
    	  | awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
        )"; \
        apk add --no-network --virtual .redis-rundeps $runDeps; \
    \
      # clear after building
        rm -r /usr/src/redis; \
        apk del --no-network .build-deps; \
    \
      # smoke tests
        redis-cli --version; \
        redis-server --version; \
    \
    mkdir /data && chown redis:redis /data;

VOLUME /data
WORKDIR /data

COPY docker-entrypoint /usr/local/bin/
ENTRYPOINT [ "docker-entrypoint" ]

EXPOSE 6379
CMD ["redis-server"]