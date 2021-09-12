FROM node:10-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install
COPY . .

EXPOSE 3000
FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=builder /usr/src/app /usr/share/nginx/html
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf.template
COPY docker/docker-entrypoint.sh /
RUN ["chmod", "+x", "/docker-entrypoint.sh"]
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
