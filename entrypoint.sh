#!/bin/bash
echo "loading env.sh file"
source /var/docker/env.sh

########################################################################################################################
# Configure and Run Couchpotato
echo "configuring Couchpotato"
cheetah f --env --oext conf $COUCHPOTATO_HOME/settings
echo "Start the Couchpotato application"
chmod +x /etc/init.d/couchpotato
service couchpotato start

########################################################################################################################
# Configure and Run Sickbeard
echo "configuring sickbeard"
cheetah f --env --oext ini $SICKBEARD_HOME/config
echo "Start the Sickbeard application"
chmod +x /etc/init.d/sickbeard
service sickbeard start

########################################################################################################################
# Configure and Run Deluge
echo "configuring deluge"
# Generate the Deluge Configuration files from ENV variables.
cheetah f --env --oext conf $DELUGE_CONFIG_HOME/core
cheetah f --env --oext conf $DELUGE_CONFIG_HOME/web
cheetah f --env --oext conf $DELUGE_CONFIG_HOME/web_plugin
cheetah f --env --oext conf $DELUGE_CONFIG_HOME/auth
mv $DELUGE_CONFIG_HOME/auth.conf $DELUGE_CONFIG_HOME/auth

# Start the Deluge Daemon
deluged -d
