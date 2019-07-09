if [ -d "synapse" ]; then
  cd ./synapse/contrib/docker/
  docker-compose up
else
  git clone https://github.com/matrix-org/synapse.git
  cd ./synapse/contrib/docker/
  sed -i.example -e "18s/.*/      - SYNAPSE_SERVER_NAME=${HOSTNAME}/" -e "37s/.*/    # labels:/" -e "38s/.*/      # - traefik.enable=true/" -e "39s/.*/      # - traefik.frontend.rule=Host:my.matrix.Host/" -e "40s/.*/      # - trafeik.port=8008/" docker-compose.yml
  # Line below is needed to decrease RAM usage by limiting the cache factor of synapse
  sed -i.example -e "21a\      - SYNAPSE_CACHE_FACTOR=0.5" docker-compose.yml
  mkdir ./files
  cd ./files
  wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/secrets.sh
  chmod +x ./secrets.sh
  ./secrets.sh
  cd ..
  docker-compose up
fi
