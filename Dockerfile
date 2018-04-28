FROM node:8-alpine

RUN apk add --no-cache git && mkdir -p /usr/src/app/matrix-appservice-slack npm install && mkdir /data
WORKDIR /usr/src/app/matrix-appservice-slack
ADD . /usr/src/app/matrix-appservice-slack
RUN npm install 

ENV SLACK_PORT 9898
ENV MATRIX_PORT 8000

VOLUME /data

ENTRYPOINT ["node", "app.js", "-c", "/data/config.yaml", "-p", "8000"]
