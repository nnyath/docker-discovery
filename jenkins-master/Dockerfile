FROM jenkins:2.60.1
MAINTAINER kenny.inthirath@gmail.com

USER root

#Install Gradle
RUN wget -O /tmp/gradle-3.4.1-bin.zip https://services.gradle.org/distributions/gradle-3.4.1-bin.zip
RUN mkdir /opt/gradle
RUN unzip -d /opt/gradle /tmp/gradle-3.4.1-bin.zip

#Install NodeJS/NPM
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

#Create the logs and cache directory
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

#Set the container env vars
#ENV JAVA_OPTS='-Xmx1024m'
ENV PATH /opt/gradle/gradle-3.4.1/bin:$PATH
ENV JENKINS_OPTS="--logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war --prefix=/jenkins"