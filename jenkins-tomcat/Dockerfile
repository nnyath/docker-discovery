FROM tomcat:8.5
MAINTAINER kenny.inthirath@hpe.com

ADD ./conf/manager-context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml
ADD ./conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml

EXPOSE 8080
