FROM jenkins:2.60.1
MAINTAINER kenny.inthirath@gmail.com

#Create the logs and cache directory
USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

#Set the container env vars
#ENV JAVA_OPTS='-Xmx1024m'
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
