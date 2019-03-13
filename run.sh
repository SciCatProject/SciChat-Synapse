git clone https://github.com/matrix-org/synapse.git
cd synapse/contrib/docker/
sed -i.example -e "18s/.*/      - SYNAPSE_SERVER_NAME=${HOSTNAME}/" -e "37s/.*/    # labels:/" -e "38s/.*/      # - traefik.enable=true/" -e "39s/.*/      # - traefik.frontend.rule=Host:my.matrix.Host/" -e "40s/.*/      # - trafeik.port=8008/" docker-compose.yml
mkdir ./files
cd ./files
wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/secrets.sh
chmod +x ./secrets.sh
./secrets.sh
cd ..
docker-compose up
