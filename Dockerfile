FROM node:15-alpine
WORKDIR /app
COPY ./extracted/app/hello /app/hello
COPY ./extracted/services/world/dist /app/services/world/dist
COPY ./extracted/services/world/node_modules /app/services/world/node_modules