FROM alpine:latest

RUN set -ex && apk update \
    && apk add --no-cache bash bzip2-dev coreutils dpkg dpkg-dev expat-dev findutils gcc gdbm-dev git libc-dev libffi-dev libnsl-dev libtirpc-dev linux-headers make ncurses-dev libressl-dev pax-utils readline-dev sqlite-dev tcl-dev tk tk-dev util-linux-dev xz-dev zlib-dev build-base linux-headers libc6-compat git wget \
    && wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz \
    && tar xf helm-v3.5.0-linux-amd64.tar.gz \
    && mv linux-amd64/helm /usr/bin/ \
    && rm -rf helm-v3.5.0-linux-amd64.tar.gz linux-amd64 \
    && wget https://www.python.org/ftp/python/3.7.10/Python-3.7.10.tgz \
    && tar -xf Python-3.7.10.tgz \
    && rm -rf Python-3.7.10.tgz \
    && cd Python-3.7.10 \
    && ./configure --prefix=/usr/local/python3.7.10 \
    && make && make install \
    && rm -rf /usr/bin/{python,pip} \
    && ln -s /usr/local/python3.7.10/bin/python3.7 /usr/bin/python \
    && ln -s /usr/local/python3.7.10/bin/pip3 /usr/bin/pip \
    && mkdir -p /app
    
WORKDIR /app

CMD ["bash"]
