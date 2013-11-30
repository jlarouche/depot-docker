#!/bin/bash
# Install Deluge & Copy Template Files
source /var/docker/env.sh
mkdir -p $DELUGE_HOME
apt-get -y install deluged