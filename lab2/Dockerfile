FROM alpine:latest AS build

ARG VERSION=1.23.3
ARG NGINX_DOWNLOAD_URL=http://nginx.org/download/nginx-${VERSION}.tar.gz

WORKDIR /tmp
RUN apk --no-cache --update add                                                     \
        build-base                                                                  \
        gnupg                                                                       \
        pcre-dev                                                                    \
        wget                                                                        \
        zlib-dev                                                                    \
        linux-headers                                                               \
        libressl-dev                                                                \
        zlib-static

RUN set -x                                                                      &&  \
    wget -q $NGINX_DOWNLOAD_URL && \
    tar -xf nginx-${VERSION}.tar.gz && \
    echo ${VERSION}

WORKDIR /tmp/nginx-${VERSION}
RUN ./configure                                                                     \
        --with-ld-opt="-static"                                                     \
        --with-http_ssl_module                                                  && \
    make && \
    make install                                                                &&  \
    strip /usr/local/nginx/sbin/nginx

RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log                         &&  \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log

FROM scratch

COPY --from=build /usr/local/nginx /usr/local/nginx
COPY --from=build /etc/passwd /etc/group /etc/

STOPSIGNAL SIGQUIT

EXPOSE 80

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g", "daemon off;"]
