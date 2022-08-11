#!/bin/sh

CERT_SUBJECT="/C=IN/ST=TG/L=HYD/O=DEVOPS/OU=DEV/CN=127.0.0.1/emailAddress=vijay@gmail.com"
CN="/CN=127.0.0.1"

openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.pem -subj "$CERT_SUBJECT"

openssl genrsa -out mongodb.key 2048
openssl req -new -key mongodb.key -out mongodb.csr -subj "$CN"
openssl x509 -req -in mongodb.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out mongodb.crt -days 500 -sha256
cat mongodb.key mongodb.crt > mongodb.pem
openssl verify -CAfile ca.pem mongodb.pem
