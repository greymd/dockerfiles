FROM alpine:3.5
MAINTAINER Yamada, Yasuhiro <greengregson@gmail.com>
RUN apk --update --no-cache add ca-certificates git g++ make && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/ryuichiueda/GlueLang.git && \
    cd GlueLang && \
    make && \
    make install
