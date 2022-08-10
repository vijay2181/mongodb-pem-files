# mongodb-pem-files

```bash
openssl genrsa -out ca.key 2048
```
```bash
openssl req -x509 -new -nodes -key ca.key -sha256 -days 1024 -out ca.pem
```
 Common Name (e.g. server FQDN or YOUR name) []:127.0.0.1
```bash
openssl genrsa -out mongodb.key 2048
```
```bash
openssl req -new -key mongodb.key -out mongodb.csr -subj "/CN=127.0.0.1"
```
```bash
openssl x509 -req -in mongodb.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out mongodb.crt -days 500 -sha256
```
```bash
cat mongodb.key mongodb.crt > mongodb.pem
```
```bash
openssl verify -CAfile ca.pem mongodb.pem
```
