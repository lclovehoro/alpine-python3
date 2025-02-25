FROM alpine:latest

RUN set -ex && apk update --no-cache \
    && apk add --no-cache gcc git libc-dev libffi-dev make libressl-dev zlib-dev wget \
    && wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz \
    && tar xf helm-v3.5.0-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/bin/ \
    && rm -rf helm-v3.5.0-linux-amd64.tar.gz linux-amd64 \
    && wget https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz \
    && tar -xf Python-3.7.10.tgz \
    && rm -rf Python-3.7.10.tgz \
    && ./Python-3.7.10/configure --prefix=/usr/local/python3.7.10 \
    && make && make install \
    && rm -rf /usr/bin/{python,pip} \
    && rm -rf ./Python-3.7.10 \
    && ln -s /usr/local/python3.7.10/bin/python3.7 /usr/bin/python \
    && ln -s /usr/local/python3.7.10/bin/pip3 /usr/bin/pip \
    && mkdir -p /app
    
WORKDIR /app

CMD ["/bin/sh"]
