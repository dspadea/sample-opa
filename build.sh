#!/usr/bin/env bash

docker build --no-cache --progress=plain -t sample-opa:latest .

# test run -- uncomment this for quicker iteration if you want
# docker run -p 8182:8181 sample-opa:latest
