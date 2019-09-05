FROM debian:jessie-slim
ENV SH_VERSION 4.3
RUN apt-get update \
    && apt-get install -y gcc \
                          make \
                          curl \
    && curl "http://ftp.gnu.org/gnu/bash/bash-${SH_VERSION}.tar.gz" \
       | tar xvz \
    && cd bash* \
    && ./configure \
    && make \
    && make install \
    && cp ./bash /bin/bash \
    && cd .. \
    && rm -rf bash* \
    && rm -rf /var/lib/apt/lists/*
