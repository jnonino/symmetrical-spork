FROM node:lts-alpine

WORKDIR /app

COPY package*.json ./

RUN apk add curl && \
    npm install --production 

COPY . .

EXPOSE 8080

CMD [ "node", "server.js" ]