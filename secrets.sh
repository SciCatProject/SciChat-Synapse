cd $HOME/Projects/synapse/contrib/docker/files

openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout scichat.synapse.se.tls.key -out scichat.synapse.se.tls.crt -subj "/CN=scichat.synapse.se" -days 3650
