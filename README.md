# Docker multistage build demo

A supporting code for Celtra developer's knowledge sharing presentation. Different techniques are shown in different branches.

This project shows how we can reduce our Docker image size.

Building image
```bash
docker build . -t celtra/multi:4th
```
This will create 2 images. First one will be our builder image and second will be our actual production image.