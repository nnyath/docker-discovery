FROM pritunl/archlinux:2017-07-08
MAINTAINER kenny.inthirath@gmail.com 

RUN groupadd dev

#Setup NGINX and users
RUN echo y | pacman -S nginx
RUN useradd --no-create-home -G dev nginx

# TODO: Switch to SSH key setup for needed containers i.e. Jenkins -> Nginx || Jenkins -> Tomcat
# Create user to deploy webapp via SCP
RUN useradd --no-create-home -G dev deploy
RUN echo "deploy:depl0y" | chpasswd

#chown /srv/http to allow deploy user access
RUN chown root:dev /srv/http
RUN chmod 774 /srv/http

#Set the config files for NGINX and Jenkins
RUN rm /etc/nginx/nginx.conf 
RUN mkdir /etc/nginx/conf.d
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/tomcat.conf /etc/nginx/conf.d/tomcat.conf
COPY ./conf/jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY ./conf/webapp.conf /etc/nginx/conf.d/webapp.conf

EXPOSE 80 

CMD ["nginx"]
