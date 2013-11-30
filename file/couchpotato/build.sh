########################################################################################################################
# Install Couchpotato & Copy Template Files
echo "Download CouchPotato"
mkdir -p $COUCHPOTATO_HOME
wget --no-check-certificate -O /tmp/couchpotato.tar.gz https://github.com/RuudBurger/CouchPotatoServer/archive/master.tar.gz
echo "Extract to the /tmp folder"
tar -xvf /tmp/couchpotato.tar.gz -C /tmp/
echo "move the content from the Sick-Beard folder to the new docker folder."
mv /tmp/CouchPotatoServer-* $COUCHPOTATO_HOME
echo "copy over the config file."
mv template/couchpotato/settings.tmpl $COUCHPOTATO_HOME/settings.tmpl

