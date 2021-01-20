FROM ubuntu:latest as builder
WORKDIR /app
COPY . .
RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL -o /tmp/go.tar.gz https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf /tmp/go.tar.gz && rm /tmp/go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"
RUN CGO_ENABLED=0 go build -o hello services/hello/main.go
WORKDIR /app/services/world
RUN npm install && npm run build

FROM builder as cleaner
WORKDIR /app
COPY --from=builder /app/services/world .
WORKDIR /app/services/world
RUN npm prune --production

FROM node:15-alpine as node-production
WORKDIR /app
COPY --from=cleaner /app/services/world/dist /app/services/world/dist
COPY --from=cleaner /app/services/world/node_modules /app/services/world/node_modules
ENTRYPOINT ["node", "/app/services/world/dist/index.js"]

FROM alpine:latest as go-production
WORKDIR /app
COPY --from=builder /app/hello .
ENTRYPOINT ["./hello"]