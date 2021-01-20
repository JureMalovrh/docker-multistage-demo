# Docker multistage build demo

A supporting code for Celtra developer's knowledge sharing presentation. Different techniques are shown in different branches.

This project shows how we can reduce our Docker image size.

To build image, run 
```bash
./build.sh
```

this will build 2 separate images, one called builder, from which we extract data and one for production use.