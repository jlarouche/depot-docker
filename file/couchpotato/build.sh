#!/bin/bash
########################################################################################################################
# Install Couchpotato & Copy Template Files
source /var/docker/env.sh
echo "Download CouchPotato"
mkdir -p $COUCHPOTATO_HOME
curl -k -L -o /tmp/couchpotato.tar.gz https://github.com/RuudBurger/CouchPotatoServer/archive/master.tar.gz
echo "Extract to the /tmp folder"
tar -xvf /tmp/couchpotato.tar.gz -C /tmp/
echo "move the content from the Couchpotato folder to the new docker folder."
mv /tmp/CouchPotatoServer-*/* $COUCHPOTATO_HOME


