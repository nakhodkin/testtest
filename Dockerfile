FROM node:alpine

WORKDIR /usr/app

ENV SKIP_PREFLIGHT_CHECK=true

#COPY package.json .
#COPY package-lock.json .
#
#RUN npm install
#
#COPY . .
#
#CMD npm start
