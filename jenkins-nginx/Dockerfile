FROM pritunl/archlinux:2017-07-08
MAINTAINER kenny.inthirath@gmail.com 

#Setup nginx and users
RUN echo y | pacman -S nginx
RUN useradd --no-create-home nginx

RUN rm /etc/nginx/nginx.conf 
COPY ./nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx"]
