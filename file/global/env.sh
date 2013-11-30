#any changes here should be duplicated in the dockerfile.
export DOCKER_HOME=/var/docker

## Couchpotato
export COUCHPOTATO_HOME=$DOCKER_HOME/couchpotato
export COUCHPOTATO_WEBUI_PORT=54321
export COUCHPOTATO_WEBUI_USER=couchpotato
export COUCHPOTATO_WEBUI_PASSWORD=admin

## Sickbeard
#export SICKBEARD_HOME=$DOCKER_HOME/sickbeard
export SICKBEARD_WEBUI_PORT=54322
export SICKBEARD_WEBUI_USER=sickbeard
export SICKBEARD_WEBUI_PASSWORD=admin

## Deluge
export DELUGE_HOME=$DOCKER_HOME/deluge
export DELUGE_CONFIG_HOME=//.config/deluge
export DELUGE_DAEMON_PORT=58846
export DELUGE_DAEMON_USER=deluge
export DELUGE_DAEMON_PASSWORD=admin
export DELUGE_WEBUI_PORT=54323

## Plex
# //fill in plex variables here.

# Matched Volumes
export VOLUME_COMPLETED_PATH=/mnt/completed
export VOLUME_PROCESSING_PATH=/mnt/processing
export VOLUME_TV_SHOW_PATH=/mnt/tvshows
export VOLUME_MOVIES_PATH=/mnt/movies
export VOLUME_BLACKHOLE_PATH=/mnt/blackhole