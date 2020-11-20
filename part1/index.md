# Part 1

## What is devops
Developement and operations are in the hands of the ones who create. This is to ensure that the gap between them is smaller than before.

## What is docker
Docker is a image creation tool to ensure that the dependencies and the application are same all across the board. This is to ensure that the developers maintaining the code are in equal playing fieland to prevent mismatching of systems.

Docker is built upon containers, which are essentially virtual machines but without the virtual machines system.

### Docker image is a file
You cannot edit existing files, but you can create a new layer to it.

### Docker container
Containers only contain the necessary parts of the application. They are isolated from the rest of the host, unless specified (like network traffic).

Cooking metaphor:

 * Dockerfile is the shopping list (& recipe).
 * Image is the ingredients.
 * Container is the delicious treat.
 
 1. To get an image, you have to build it with the Dockerfile.
 2. You then run the image creating a container.


# Hello world docker
Made docker be able to run without adding sudo on top of it.
Also WSL debian has some problems with fstab, had to solve those as well. 
Also what system doesn't use systemctl now a days? Debian it seems.

Done.

To delete all of the stopped containers use `docker container prune`
To delete all images and containers use `docker system prune` 

## To search
`docker search "packagename"`


# Commands
In our command -it is short for -i and -t where -i is “interactive, connect STDIN” and -t “allocate a pseudo-TTY”. Or to put it more simply, -it allows you to interact with the container by using the command line. From the ps aux listing we can see that our bash process got PID (process ID) of 300.
