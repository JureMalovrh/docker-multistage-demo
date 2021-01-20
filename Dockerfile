FROM ubuntu:latest
WORKDIR /app
COPY . .

RUN apt-get update -y
RUN apt-get install curl -y
RUN curl -fsSL -o /tmp/go.tar.gz https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf /tmp/go.tar.gz
RUN rm /tmp/go.tar.gz

ENV PATH="/usr/local/go/bin:${PATH}"
RUN go build -o hello services/hello/main.go

RUN apt-get install nodejs -y
RUN apt-get install npm -y

WORKDIR /app/services/world
RUN npm install
RUN npm run build
