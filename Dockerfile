# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

# set a health check
#HEALTHCHECK --interval=5s \
#            --timeout=5s \
#            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000


# Install Node

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash

RUN apt-get -y install nodejs

RUN node -v

RUN npm -v

RUN npm install -g newman

RUN newman run collection.json –e collection.env.json
