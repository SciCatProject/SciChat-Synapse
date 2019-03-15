# SciChat-Synapse
Local chat-server

## Setup guide

### Setup server:
- Download the script *run.sh*, make it executable then execute it
  ```
  wget https://raw.githubusercontent.com/SciCatProject/SciChat-Synapse/master/run.sh
  chmod +x ./run.sh
  ./run.sh
  ```
  
  The synapse server should now be up and running!

- To check, go to your browser and navigate to
  ```
  https://<your.host.name>:8448
  ```
  - If the browser complains about your Self Signed Certificate (the one generated using *secrets.sh*), simply add it to your browsers exceptions and you should be good to go!
  
### Connect Riot.im to server:
- Go to https://riot.im/app

- At top of the login/register prompt you'll see *Sign in to your Matrix account on [...]*. Click on the text *Change*.

- Change the *Homeserver URL* to *https://<your.host.name>:8448*

- Now you should be able to login/register and interact with your Synapse server!
  
  
### Using synapse with the SciChat client

The client doesn't allow interaction with servers using Self Signed Certificates by default. To be able to interact with the server through the client, you need to add the following line to the file you run with npm start:
```
process.env["NODE_TLS_REJECT_UNAUTHORIZED"] = 0;
```

**Please note that this should only be used for development. When deploying, use a certificate from [Let's Encrypt](https://letsencrypt.org/) instead.**
