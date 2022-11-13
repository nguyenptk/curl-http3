FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y git autoconf libtool pkg-config \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/*

ARG OPENSSL_VERSION=openssl-3.0.0+quic
ARG NGHTTP3_VERSION=v0.7.1
ARG NGTCP2_VERSION=v0.11.0
ARG CURL_VERSION=curl-7_86_0

# Build (patched) OpenSSL
RUN git clone --depth 1 -b $OPENSSL_VERSION https://github.com/quictls/openssl \
    && cd openssl \
    && ./config enable-tls1_3 --prefix=/usr/local \
    && make \
    && make install

# Build nghttp3
RUN cd .. \
    && git clone --depth 1 -b $NGHTTP3_VERSION https://github.com/ngtcp2/nghttp3 \
    && cd nghttp3 \
    && autoreconf -fi \
    && ./configure --prefix=/usr/local --enable-lib-only \
    && make \
    && make install

# Build ngtcp2
RUN cd .. \
    && git clone --depth 1 -b $NGTCP2_VERSION https://github.com/ngtcp2/ngtcp2 \
    && cd ngtcp2 \
    && autoreconf -fi \
    && ./configure PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/local/lib/pkgconfig LDFLAGS="-Wl,-rpath,/usr/local/lib" --prefix=/usr/local --enable-lib-only \
    && make \
    && make install

# Build curl
RUN cd .. \
    && git clone --depth 1 -b $CURL_VERSION https://github.com/curl/curl \
    && cd curl \
    && autoreconf -fi \
    && LDFLAGS="-Wl,-rpath,/usr/local/lib" ./configure --with-openssl=/usr/local --with-nghttp3=/usr/local --with-ngtcp2=/usr/local \
    && make \
    && make install

# cleanup
RUN cd .. \
    && rm -rf openssl nghttp3 ngtcp2 curl

# Check
RUN curl --version

CMD ["curl"]
