
FROM node:13.12.0-alpine
WORKDIR /var/www/html/epeServer
ENV PATH /var/www/html/epeServer/node_modules/.bin:$PATH
COPY . ./
RUN apk add --update python make g++\
   && rm -rf /var/cache/apk/*
RUN npm install --silent
RUN npm i --save --save-exact bcrypt
EXPOSE 5000:5000
CMD ["npm", "run prod"]