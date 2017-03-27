FROM debian:jessie-slim
MAINTAINER Yamada, Yasuhiro <greengregson@gmail.com>
RUN apt update && \
    apt install -y git make g++ && \
    git clone https://github.com/ryuichiueda/GlueLang.git && \
    cd GlueLang && \
    make && \
    make install
