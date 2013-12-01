#!/bin/bash
# Install Sickbeard & Copy Template Files
# Download TBP branch for Sickbeard
source /var/docker/env.sh
mkdir -p $SICKBEARD_HOME
curl -k -L -o /tmp/sickbeard.tar.gz https://github.com/mr-orange/Sick-Beard/archive/ThePirateBay.tar.gz
# Extract the TPB branch to the /tmp folder
tar -xvf /tmp/sickbeard.tar.gz -C /tmp/
# move the content from the Sick-Beard folder to the new docker folder.
mv /tmp/Sick-Beard-*/* $SICKBEARD_HOME
