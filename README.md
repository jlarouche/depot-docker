This is a dockerfile for the Depot media server. It will download and configure the following software inside a Docker container:

1. Deluge
2. Sickbeard
3. CouchPotato
4. Bittorrent Sync
5. Plex


# Build Command:
docker build -rm -t depot github.com/AnalogJ/depot-docker

# Run Command:

# Remove all docker images
`docker rmi $(docker images | grep -v 'ubuntu\|my-image' | awk {'print $3'})`

# run interactive shell on a docker image
`docker run -p 127.0.0.1:54322:54322 -i -t sickbeard /bin/bash`

# Tag a image
`docker tag 85bd818c5744 sickbeard`