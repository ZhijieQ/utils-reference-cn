FROM node:16-alpine3.17 AS builder
RUN apk add --no-cache libc6-compat
WORKDIR /tmp

COPY . .
RUN yarn install
RUN yarn prepare
RUN yarn build
RUN yarn prettier
RUN yarn markdownlint
## If you want run build, you need to delete --production
# RUN npm run build



# Base on offical NGINX Alpine image
FROM nginx:alpine

# Remove any existing config files
RUN rm /etc/nginx/conf.d/*

# Copy config files
# *.conf files in conf.d/ dir get included in main config
COPY ./web/default.conf /etc/nginx/conf.d/

WORKDIR /app
COPY --from=builder /tmp/dist ./

# Expose the listening port
EXPOSE 80

# Launch NGINX
CMD [ "nginx", "-g", "daemon off;" ]
