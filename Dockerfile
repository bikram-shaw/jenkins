FROM node:latest as node
WORKDIR /docker-jenkins
COPY . .
RUN npm install
RUN npm run build

FROM nginx:alpine
COPY --from=node /docker-jenkins/dist/docker-jenkins/ /usr/share/nginx/html
