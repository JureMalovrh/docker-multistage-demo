# Docker multistage build demo

A supporting code for Celtra developer's knowledge sharing presentation. Different techniques are shown in different branches.

This project shows how we can reduce our Docker image size.

Building separate image for each lanugage used.

```bash
docker build . --target go-production -t celtra/multi:go
docker build . --target node-production -t celtra/multi:node
```