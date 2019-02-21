# cd $HOME/Projects/synapse/contrib/docker/files

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout localhost.tls.key -out localhost.tls.crt -subj "/CN=localhost" -days 3650
