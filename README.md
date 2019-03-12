# SciChat-Synapse
Local chat-server

## Setup guide:

- Git clone the synapse repository: https://github.com/matrix-org/synapse

  ```
  git clone https://github.com/matrix-org/synapse.git
  ```

- Go to subdirectory */contrib/docker/*

  ```
  cd synapse/contrib/docker/
  ```

- Open the file: *docker-compose.yml*, locate *- SYNAPSE_SERVER_NAME* and change the value from the default to *localhost*.

  ```
  - SYNAPSE_SERVER_NAME=localhost
  ```
  
  Save and exit.
  
- In the current directory, create a new subdirectory *./files* and cd into it.
  ```
  mkdir ./files
  cd ./files
  ```
  
- Download the script from this repository and place it in the current folder.
```
wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/secrets.sh
```

- Run the script. This will generate the files *localhost.tls.crt* and *localhost.tls.key*.
  ```
  ./secrets.sh
  ```
  
- Go back to the directory */contrib/docker/*.
  ```
  cd ..
  ```

- Run command:
  ```
  docker-compose up
  ```

  The synapse server should now be up and running!

- To check, go to your browser and navigate to
  ```
  https://localhost:8448
  ```
  - If the browser complains about your Self Signed Certificate (the one generated using *secrets.sh*), simply add it to your browsers exceptions and you should be good to go!
  
  
### Using synapse with the SciChat client

The client doesn't allow interaction with servers using Self Signed Certificates by default. To be able to interact with the server through the client, you need to add the following line to the file you run with npm start:
```
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
```

**Please note that this should only be used for development. When deploying, use a certificate from [Let's Encrypt](https://letsencrypt.org/) instead.**
