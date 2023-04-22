#!/bin/sh

while true; do
  openssl req -x509 -newkey rsa:4096 -nodes -keyout /certs/key.pem -out /certs/cert.pem -days 1 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=localhost"
  sleep 86400
done
