FROM debian:stretch-slim
MAINTAINER Percona Development <info@percona.com>

RUN apt-get update && apt-get install -y --no-install-recommends \
                gnupg \
                dirmngr \
                apt-transport-https ca-certificates \
                pwgen \
        && rm -rf /var/lib/apt/lists/*

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8507EFA5

RUN echo 'deb https://repo.percona.com/apt stretch main' > /etc/apt/sources.list.d/percona.list

RUN  apt-get update \
        && apt-get install -y percona-toolkit \
        && rm -rf /var/lib/apt/lists/* 

ENV PERCONA_VERSION 3.0.6

WORKDIR /