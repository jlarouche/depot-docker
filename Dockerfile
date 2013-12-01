# Depot-Docker
#
FROM ubuntu
MAINTAINER Jason Kulatunga jason@thesparktree.com

########################################################################################################################
# Global Configuration
#any changes here should be duplicated in the env.sh. file.
ENV DOCKER_HOME /var/docker

## Couchpotato
ENV COUCHPOTATO_HOME $DOCKER_HOME/couchpotato
ENV COUCHPOTATO_WEBUI_PORT 54321
EXPOSE 54321

## Sickbeard
ENV SICKBEARD_HOME $DOCKER_HOME/sickbeard
ENV SICKBEARD_WEBUI_PORT 54322
EXPOSE 54322

## Deluge
ENV DELUGE_CONFIG_HOME //.config/deluge
ENV DELUGE_WEBUI_PORT 54323
EXPOSE 54323

VOLUME ["/mnt/completed","/mnt/processing", "/mnt/tvshows","/mnt/movies","/mnt/blackhole"]

# Generate Required Folder
RUN mkdir -p $DOCKER_HOME

# Copy over the run program
ADD file/global/env.sh $DOCKER_HOME/env.sh
ADD entrypoint.sh $DOCKER_HOME/entrypoint.sh
ENTRYPOINT /bin/bash /var/docker/entrypoint.sh

# Install Templating Prerequsites (Wget, Python-Cheetah)
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list &&\
    apt-get update && apt-get upgrade -y &&\
    apt-get -y install python-cheetah &&\
    apt-get -y install curl

########################################################################################################################
# Install Couchpotato & Copy Template Files
ADD file/couchpotato/build.sh $DOCKER_HOME/couchpotato_build.sh
RUN /bin/bash $DOCKER_HOME/couchpotato_build.sh
ADD template/couchpotato/settings.tmpl $COUCHPOTATO_HOME/settings.tmpl

########################################################################################################################
# Install Sickbeard & Copy Template Files
ADD file/sickbeard/build.sh $DOCKER_HOME/sickbeard_build.sh
RUN /bin/bash $DOCKER_HOME/sickbeard_build.sh
ADD template/sickbeard/config.tmpl $SICKBEARD_HOME/config.tmpl

########################################################################################################################
# Install Deluge & Copy Template Files
ADD file/deluge/build.sh $DOCKER_HOME/deluge_build.sh
RUN /bin/bash $DOCKER_HOME/deluge_build.sh
ADD template/deluge/auth.tmpl $DELUGE_CONFIG_HOME/auth.tmpl
ADD template/deluge/core.tmpl $DELUGE_CONFIG_HOME/core.tmpl
ADD template/deluge/web.tmpl $DELUGE_CONFIG_HOME/web.tmpl
ADD template/deluge/web_plugin.tmpl $DELUGE_CONFIG_HOME/web_plugin.tmpl