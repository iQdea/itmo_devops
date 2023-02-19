FROM alpine:3.2 as build

ENV NGINX_VERSION nginx-1.9.12

RUN apk --update add openssl-dev pcre-dev zlib-dev wget build-base
RUN mkdir -p /tmp/src
RUN cd /tmp/src
RUN wget http://nginx.org/download/${NGINX_VERSION}.tar.gz
RUN tar -zxvf ${NGINX_VERSION}.tar.gz
RUN chmod a+rx ${NGINX_VERSION}
RUN cd ${NGINX_VERSION} && \
./configure                                                                     \
        --with-ld-opt="-static"                                                     \
        --with-http_sub_module                                                  &&  \
    make install                                                                &&  \
    strip /usr/local/nginx/sbin/nginx

RUN ln -sf /dev/stdout /usr/local/nginx/logs/access.log                         &&  \
    ln -sf /dev/stderr /usr/local/nginx/logs/error.log

FROM scratch

COPY --from=build /etc/passwd /etc/group /etc/
COPY --from=build /usr/local/nginx /usr/local/nginx

STOPSIGNAL SIGQUIT

EXPOSE 80

ENTRYPOINT ["/usr/local/nginx/sbin/nginx"]
CMD ["-g", "daemon off;"]
