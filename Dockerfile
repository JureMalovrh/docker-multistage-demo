FROM ubuntu:latest
WORKDIR /app
COPY . .

RUN apt-get update -y && apt-get install -y --no-install-recommends \
    curl \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*
RUN curl -fsSL -o /tmp/go.tar.gz https://golang.org/dl/go1.15.6.linux-amd64.tar.gz && tar -C /usr/local -xzf /tmp/go.tar.gz && rm /tmp/go.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"
RUN go build -o hello services/hello/main.go

WORKDIR /app/services/world
RUN npm install && npm run build
