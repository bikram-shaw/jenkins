FROM node:12.19.0-alpine as builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.13.12-alpine
COPY --from=builder /usr/src/app/dist/docker-jenkins/ /usr/share/nginx/html
