# use a node base image
FROM node:10.15.1-alpine

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

# Set Working Directory
WORKDIR /usr/src/app

# set a health check
#HEALTHCHECK --interval=5s \
#            --timeout=5s \
#            CMD curl -f http://127.0.0.1:8000 || exit 1

# tell docker what port to expose
EXPOSE 8000

COPY . .

# Run npm with full permission
RUN npm config set unsafe-perm true

RUN npm install -g newman

RUN newman run collection.json -e collection.env.json
