#!/usr/bin/env bash

set -e

if [[ "$1" == "-b" ]]; then
  docker build -t damon/python-starred .
fi

(
  set -x
  docker run --rm -it -e GITHUB_TOKEN \
    damon/python-starred --username "$GITHUB_USER" --sort > readme.md
)
