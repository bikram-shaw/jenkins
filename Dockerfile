FROM node:10-alpine as node
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=node /app/dist/docker-jenkins /usr/share/nginx/html
