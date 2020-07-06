# Deploying Bina customisations to BBM BBB server

In order to provide a unique experience for Bina students and teachers, we have developed a customised HTML5 client fork, based on the original BBB client that provides some enhanced functionality (like webpage share), some customisations around colors and fonts and some configuration changes to improve the UI. To use this fork it needs to be deployed onto a BBB installation provided by BBM (it can be deployed onto a fresh BBB installation or over an existing customised server).

## Mac guide:
### Requirements
* Docker installation (https://www.docker.com/products/docker-desktop)
* Git
* SSH & BASH

### Steps

#### Install SSH keys

1. Obtain the SSH keys from Zach Bowen
2. Copy the files : id_rsa_bina & id_rsa_bina.pub to the ~/.ssh/ 3. directory
4. Edit the file ~/.ssh/config and add the lines :

`
Host *.bigbluemeeting.com
     User root
     IdentityFile ~/.ssh/id_rsa_bina
`

[IN THE CASE THAT THE SERVER has moved on to a new IP, you have to delete any entries in your ~/.ssh/known_hosts file that are bound to the old IP address (the lines start with *.bigbluemeeting.com)]

#### Checkout the custom source code 

1. Download the git repo
2. Create a new folder & clone the BBB fork repo with
```
Git clone git@github.com:binaschool/bigbluebutton.git
Cd bigbluebutton
```
3. Change to the 2.2.x release branch
```
Git checkout v2.2.x-release
```
4. Build and deploy the code

> Before building and deploying the code, make sure your docker installation has enough memory configured, click on the docker icon in the top bar, Preferences->Resources->Memory - needs to be minimum 8gig for the build script to run successfully.

##### Prod
Run the following commands :
```
cd bigbluebutton-html5
./deploy_prod.sh
[after the docker build is complete, it will push & deploy the artifacts to the server, you need to enter the passphrase from the private key]
```

##### Staging
Run the following commands :
```
cd bigbluebutton-html5
./deploy_stg.sh
[after the docker build is complete, it will push & deploy the artifacts to the server, you need to enter the passphrase from the private key]
```

##### Common issues
If the server builds the package but you miss the moment to enter the SSH passphrase and the connection times out, don’t worry. For staging you can run the ./deployOnly_stg.sh and for production you can run ./deployOnly_prod.sh
