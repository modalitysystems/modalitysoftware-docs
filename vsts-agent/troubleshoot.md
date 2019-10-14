# Troubleshoot Tips

Both the Docker host and the Docker containers require access to the internet for this to work. To check both of these are true run:

docker run --rm -it hello-world ping 8.8.8.8
