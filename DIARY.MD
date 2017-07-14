# Docker and Jenkins Environment Setup

In order to make deployment less painful, I wanted to setup a decent build and deploy pipeline for this application.
I anticipate this application to require changes at a moment's notice and will probably shift developers around in the near future.

Building an easy to deploy image is aimed to address those major pain points.

## Requirements
### Languages
* Java
* NodeJS

### Application Hosts
* Tomcat (Build and Host Java Backend)
* Nginx (React Frontend)

### Deployment Tools
* Docker (Containers)
* Jenkins (CI/CD)

## Setup

This is just a diary of the setup from start to finish of the dockerized environment.
If all goes well, one shouldn't have to recreate these steps, but it would be useful to understand if one has never delved into the world of Docker/Jenkins (aka me :D)

#### Install Docker
1. Install Docker (pacman)
    * `sudo pacman -S docker`
2. Add user to docker group
    * `usermod -a -G docker dev`
3. Start docker.service (sudo)
    * `sudo systemctl start docker.service`
4. Test to see non-root privs
    * `docker run hello-world`
5. __(Optional)__ Install docker-compose (pacman community)
6. __(Optional)__ Docker-machine (VM management for Docker Containers)


#### Using the official Jenkins Image
1. Pull Jenkins Docker image
    * `docker pull jenkins`
2. Run Jenkins Image (-d with no output)
    * `docker run -p 8080:8080 --name=jenkins-master -d jenkins`
3. Test Jenkins Access
    * `localhost:8080`
    * __(Hint)__ Get the initial run password by getting shell access to the docker container
        * `docker exec -it jenkins-master /bin/bash`
        * `cat /var/jenkins_home/secrets`
4. __(Optional)__ Set Jenkins memory allocation and thread allocation
    * `docker run -p 8080:8080 --name=jenkins-master -d --env JAVA_OPTS="-Xmx8192m" -env JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300" jenkins`
5. __(Optional)__ Use the makefile for easy command scripting
    * make build    - Pulls the Jenkins image
    * make run      - Runs the container
    * make stop    - Stops the container
    * make clean  - Stops and deletes the existing container

At this point, we have a very default, containerized Jenkins setup. However we are missing a few things
* No persitance
* No logging
* No webproxy 
* No specific Jenkins version to use

#### Wrapping the Official Image to Meet Our Needs

1. Create a Dockerfile
    * `vim Dockerfile`
    * Add the following
```
FROM jenkins:2.60.1
MAINTAINER [Your_Name]
USER root
RUN mkdir /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
USER jenkins
#ENV JENKINS_OPTS='--logfile=/var/log/jenkins/jenkins.log'
#ENV JAVA_OPTS='-Xmx1024m'
```
There are a few extra options we introduce such as logging
The big one however is the use of persitent storage via another volume image

So we create another docker image based on Debian and mirror the directories we want to use
The docker file recognizes all the VOLUME arguments and uses them

So even if we restart our container, the data will be contained in the other one

However, there are still some issues to iron out

#### Proxying NGINX
