FROM node:12.19.0-alpine as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

FROM nginx:1.17.1-alpine
COPY --from=builder /app/dist/docker-jenkins/ /usr/share/nginx/html
