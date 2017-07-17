FROM debian:jessie
MAINTAINER kenny.inthirath@gmail.com 

#Create the Jenkins user
RUN useradd -d "/var/jenkins_home" -u 1000 -m -s /bin/bash jenkins

#Create log dir
RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins

RUN mkdir -p /var/http
RUN chown -R jenkins:jenkins /var/http
RUN chmod -R 774 /var/http

#Create the data volume
VOLUME ["/var/log/jenkins","/var/jenkins_home","/var/http"]

USER jenkins
CMD ["echo", "Data container for Jenkins"]
