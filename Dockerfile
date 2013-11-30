# Depot-Docker
#
FROM ubuntu
MAINTAINER Jason Kulatunga jason@thesparktree.com

########################################################################################################################
# Global Configuration
ENV DOCKER_HOME /var/docker

## Couchpotato
ENV COUCHPOTATO_HOME $DOCKER_HOME/couchpotato
ENV COUCHPOTATO_WEBUI_PORT 54321
ENV COUCHPOTATO_WEBUI_USER couchpotato
ENV COUCHPOTATO_WEBUI_PASSWORD admin
EXPOSE 54321

## Sickbeard
ENV SICKBEARD_HOME $DOCKER_HOME/sickbeard
ENV SICKBEARD_WEBUI_PORT 54322
ENV SICKBEARD_WEBUI_USER sickbeard
ENV SICKBEARD_WEBUI_PASSWORD admin
EXPOSE 54322

## Deluge
ENV DELUGE_HOME $DOCKER_HOME/deluge
ENV DELUGE_CONFIG_HOME //.config/deluge
ENV DELUGE_DAEMON_PORT 58846
ENV DELUGE_DAEMON_USER deluge
ENV DELUGE_DAEMON_PASSWORD admin
ENV DELUGE_WEBUI_PORT 54323
EXPOSE 54323

## Plex
# //fill in plex variables here.

# Matched Volumes
ENV VOLUME_COMPLETED_PATH /mnt/completed
ENV VOLUME_PROCESSING_PATH /mnt/processing
ENV VOLUME_TV_SHOW_PATH /mnt/tvshows
ENV VOLUME_MOVIES_PATH /mnt/movies
ENV VOLUME_BLACKHOLE_PATH /mnt/blackhole
VOLUME ["/mnt/completed","/mnt/processing", "/mnt/tvshows","/mnt/movies","/mnt/blackhole"]

# Generate Required Folders
RUN mkdir -p $DOCKER_HOME
RUN mkdir -p $COUCHPOTATO_HOME
RUN mkdir -p $SICKBEARD_HOME
RUN mkdir -p $DELUGE_HOME

# Copy over the run program
ADD entrypoint.sh $DELUGE_HOME/entrypoint.sh
ENTRYPOINT /var/docker/entrypoint.sh

# Install Templating Prerequsites
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y
# Install Python-Cheetah, a prereq for templating
RUN apt-get -y install python-cheetah

########################################################################################################################
# Install Couchpotato & Copy Template Files
# Download CouchPotato
ADD https://github.com/RuudBurger/CouchPotatoServer/archive/master.tar.gz /tmp/couchpotato.tar.gz
# Extract to the /tmp folder
RUN tar -xvf /tmp/couchpotato.tar.gz -C /tmp/
# Create the docker couchpotato folder.
RUN mkdir -p /var/docker
# move the content from the Sick-Beard folder to the new docker folder.
RUN mv /tmp/CouchPotatoServer-* $COUCHPOTATO_HOME
#copy over the config file.
ADD template/couchpotato/settings.tmpl $COUCHPOTATO_HOME/settings.tmpl

########################################################################################################################
# Install Sickbeard & Copy Template Files
# Download TBP branch for Sickbeard
ADD https://github.com/mr-orange/Sick-Beard/archive/ThePirateBay.tar.gz /tmp/sickbeard.tar.gz
# Extract the TPB branch to the /tmp folder
RUN tar -xvf /tmp/sickbeard.tar.gz -C /tmp/
# move the content from the Sick-Beard folder to the new docker folder.
RUN mv /tmp/Sick-Beard-* $SICKBEARD_HOME
#copy over the config file.
ADD template/sickbeard/config.tmpl $SICKBEARD_HOME/config.tmpl

########################################################################################################################
# Install Deluge & Copy Template Files
RUN apt-get -y install deluged
ADD template/deluge/auth.tmpl $DELUGE_CONFIG_HOME/auth.tmpl
ADD template/deluge/core.tmpl $DELUGE_CONFIG_HOME/core.tmpl
ADD template/deluge/web.tmpl $DELUGE_CONFIG_HOME/web.tmpl
ADD template/deluge/web_plugin.tmpl $DELUGE_CONFIG_HOME/web_plugin.tmpl




