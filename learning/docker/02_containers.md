# Docker

**Build the Dockerfile and give it a tag**

    docker build -t friendlyhello

**List Docker images**

    docker images

**Run the image as container**

    docker run friendlyhello

To run the image in a detached mode:

    docker run -d friendlyhello    

**List running containers**

    docker container ls

**Stop a running container**

Now use docker container stop to end the process, using the CONTAINER ID, like so:

    docker container stop 1fa4ab2cf395