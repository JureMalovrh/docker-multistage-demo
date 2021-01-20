# Docker multistage build demo

A supporting code for Celtra developer's knowledge sharing presentation. Different techniques are shown in different branches.

This project shows how we can reduce our Docker image size.

Production Docker image sizes
| Image tag      | Size |
| ----------- | ----------- |
| 1st (basic image)      | 1.25 GB       |
| 2nd (minifying run commands)   | 645MB        |
| 3rd (builder pattern)   | 176MB        |
| 4th (multistage build)   | 117MB        |
| 5th (multistage build - separate image)   | 12MB (Go) and 110MB (Node)  |

Resources:
- [Builder pattern vs. multistage build](https://blog.alexellis.io/mutli-stage-docker-builds/)
- [Tips for minimizing images](https://hackernoon.com/tips-to-reduce-docker-image-sizes-876095da3b34)
- [Docker multistage builds](https://docs.docker.com/develop/develop-images/multistage-build/)