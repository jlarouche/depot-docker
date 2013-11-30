#!/bin/bash
# Install Sickbeard & Copy Template Files
# Download TBP branch for Sickbeard
mkdir -p $SICKBEARD_HOME
wget --no-check-certificate -O /tmp/sickbeard.tar.gz https://github.com/mr-orange/Sick-Beard/archive/ThePirateBay.tar.gz
# Extract the TPB branch to the /tmp folder
tar -xvf /tmp/sickbeard.tar.gz -C /tmp/
# move the content from the Sick-Beard folder to the new docker folder.
mv /tmp/Sick-Beard-* $SICKBEARD_HOME
#copy over the config file.
mv template/sickbeard/config.tmpl $SICKBEARD_HOME/config.tmpl