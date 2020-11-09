FROM node:latest as node
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=node /usr/src/app/dist/docker-jenkins/ /usr/share/nginx/html
