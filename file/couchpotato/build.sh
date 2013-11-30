########################################################################################################################
# Install Couchpotato & Copy Template Files
# Download CouchPotato
wget --no-check-certificate -O /tmp/couchpotato.tar.gz https://github.com/RuudBurger/CouchPotatoServer/archive/master.tar.gz
# Extract to the /tmp folder
tar -xvf /tmp/couchpotato.tar.gz -C /tmp/
# move the content from the Sick-Beard folder to the new docker folder.
mv /tmp/CouchPotatoServer-* $COUCHPOTATO_HOME
#copy over the config file.
mv template/couchpotato/settings.tmpl $COUCHPOTATO_HOME/settings.tmpl

