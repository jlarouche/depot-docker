#!/bin/bash
# Install Deluge & Copy Template Files
source /var/docker/env.sh
mkdir -p $DELUGE_HOME
apt-get -y install deluged
mv template/deluge/auth.tmpl $DELUGE_CONFIG_HOME/auth.tmpl
mv template/deluge/core.tmpl $DELUGE_CONFIG_HOME/core.tmpl
mv template/deluge/web.tmpl $DELUGE_CONFIG_HOME/web.tmpl
mv template/deluge/web_plugin.tmpl $DELUGE_CONFIG_HOME/web_plugin.tmpl