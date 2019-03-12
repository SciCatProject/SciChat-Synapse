git clone https://github.com/matrix-org/synapse.git
cd synapse/contrib/docker/
sed -i '18s/.*/- SYNAPSE_SERVER_NAME=${HOSTNAME}' docker-compose.yml
mkdir ./files
cd ./files
wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/secrets.sh
./secrets.sh
cd ..
docker-compose up
