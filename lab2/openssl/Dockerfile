FROM alpine AS openssl

RUN apk add --no-cache openssl

WORKDIR /certs

COPY ./generate-certs.sh ./

CMD ["sh", "/certs/generate-certs.sh"]
