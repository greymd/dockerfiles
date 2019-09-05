FROM alpine:3.5
RUN apk --update --no-cache add ca-certificates git g++ make && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/ryuichiueda/GlueLang.git && \
    cd GlueLang && \
    make && \
    make install
