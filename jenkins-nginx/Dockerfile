FROM pritunl/archlinux:2017-07-08
MAINTAINER kenny.inthirath@gmail.com 

#Setup NGINX and users
RUN echo y | pacman -S nginx
RUN useradd --no-create-home nginx

#Set the config files for NGINX and Jenkins
RUN rm /etc/nginx/nginx.conf 
RUN mkdir /etc/nginx/conf.d
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/jenkins.conf /etc/nginx/conf.d/jenkins.conf

EXPOSE 80

CMD ["nginx"]
