# Docker

**Login Docker**

Log in to the Docker public registry on your local machine.

    docker login

**Tag the image**

The notation for associating a local image with a repository on a registry is username/repository:tag. The tag is optional.

Run docker tag image with your username, repository, and tag names so that the image will upload to your desired destination. The syntax of the command is:

    docker tag image username/repository:tag

example

    docker tag friendlyhello john/get-started:part2

List docker images to see the new image

    docker images

**Publish the image**

    docker push username/repository:tag

**Pull and run the image from the remote repository**

    docker run -p 4000:80 username/repository:tag

example

    docker run -p 4000:80 john/get-started:part2