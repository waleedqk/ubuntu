# Docker


## General Definition

An image is a lightweight, stand-alone, executable package that includes everything needed to run a piece of software, including the code, a runtime, libraries, environment variables, and config files.

A container is a runtime instance of an image—what the image becomes in memory when actually executed. It runs completely isolated from the host environment by default, only accessing host files and ports if configured to do so.

## Dockerfile

Dockerfile will define what goes on in the environment inside your container.  Be specific about what files you want to “copy in” to that environment. Dockerfile will behave exactly the same wherever it runs.

**Check Docker version**

    docker --version

**Check docker install**

    docker run hello-world

**List Docker Processes**

    docker ps


## References

https://docs.docker.com/get-started