git clone https://github.com/matrix-org/synapse.git
cd synapse/contrib/docker/
sed -ie "18s/.*/      - SYNAPSE_SERVER_NAME=${HOSTNAME}/" docker-compose.yml
sed -ie "37s/.*/    # labels:/" docker-compose.yml
sed -ie "38s/.*/      # - traefik.enable=true/" docker-compose.yml
sed -ie "39s/.*/      # - traefik.frontend.rule=Host:my.matrix.Host/" docker-compose.yml
sed -ie "40s/.*/      # - trafeik.port=8008/" docker-compose.yml
mkdir ./files
cd ./files
wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/secrets.sh
chmod +x ./secrets.sh
./secrets.sh
cd ..
docker-compose up
