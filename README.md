# Another dockerized symfony image!
This time an all-in-one container for developing, testing and deploying symfony projects.
This image contains all services that are needed for a deployed symfony application to run but no database and other
external services, **specifically designed for production use!**
  
**The Idea**  
Inspired by the way java frameworks like spring boot handle their build artifacts in a single executable that is runable
without any more configuration, I have implemented this image to provide a kind of equal solution for symfony(/php) projects.
The goal is simple: A ci build should end with a single binary to execute that just works when I spin it up.

## How to use
All source code has to be located inside `/var/www/app`. For local development you usually use the `latest-dev` tag and
mount a local project directory to this directory, when you build up a production image you usually copy the source code
of the current version into that directory and use the `latest` image tag.

## Container provisioning
Since we do not want any configuration after the container has been build and started, the image has to be configured to
provision itself as soon as a container will be created from it. We utilize the docker entrypoint for that, the image
has a custom entrypoint script that runs all files within `/usr/local/bin/provisioner/` everytime a container based on
our image is started up. Keep in mind: The entrypoint is called on **every** startup of the container, no matter if it is
a new container from that image or a existing container that has just been stopped. Make sure that the commands you fire
in your custom provisioner scripts are able to handle this (for example: don't drop the database and create a new one in a
provisioner script).
  
Currently we provide basic provisioner scripts that run composer install and database migrations, feel free to add
custom scripts or delete/update the ones that are provided in the image. After all provisioner scripts are ran, the
symfony cache will be warmed up and all other services (nginx, php) are started.

## Continuous Integration
Our custom docker image entrypoint is automatically called when the container starts... which is great, right?
Unfortunately, the downside of entrypoints is, that the container may look like it's running, but it actually still runs
the container provisioning from the entrypoint. To identify if a container is *really* ready, I've provided a small
script: `entrypoint_status` (`/usr/local/bin/entrypoint_status`). After creating a container from the image, you can
call entrypoint_status (e.g. `docker exec <container-name> entrypoint_status`), and the script will run until the container
is *truly* ready to exit with exit code 0 (success). If the container should not be able to start properly, it exits with
code 1 after 5 minutes to prevent your pipelines from getting stuck.  