openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout ${HOSTNAME}.tls.key -out ${HOSTNAME}.tls.crt -subj "/CN=${HOSTNAME}" -days 3650
