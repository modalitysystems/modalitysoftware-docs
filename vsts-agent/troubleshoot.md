# Troubleshoot Tips

Both the Docker host and the Docker containers require access to the internet for this to work. To check this run:

docker run --rm -it hello-world ping 8.8.8.8

![hello-world](hello-world.png)

The first bit checks that the Docker host is able to download images from Docker Hub and the second bit checks that a container can ping a machine on the internet. Hyper-V is used by Docker to provide a NAT connection to the internet along with a virtual NIC for each container.

>[Click here for usefull scripts to diagnose issues](scripts/)
