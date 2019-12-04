# A python docker container that runs Starred
# https://github.com/maguowei/starred

FROM python:3-alpine

ENV STARRED_VERSION 3.0.0

RUN apk add --no-cache --virtual .build-deps \
      coreutils \
      gcc \
      libc-dev \
      libffi-dev \
      linux-headers \
      openssl-dev \
      util-linux-dev \
    \
    && ( set -x ; pip install --no-cache-dir "starred==${STARRED_VERSION}" ) \
    \
    && apk del .build-deps

ENTRYPOINT ["/usr/local/bin/starred"]

CMD ["--help"]
