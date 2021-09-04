FROM ubuntu:latest

#install all the tools you might want to use in your container
RUN apt-get update
RUN apt-get install curl -y
RUN apt-get install vim -y
#the following ARG turns off the questions normally asked for location and timezone for Apache
ARG DEBIAN_FRONTEND=noninteractive:
RUN apt-get install apache2 -y

RUN echo 'ServerName myserver.mydomain.com >> /etc/apache2/apache2.conf'

#change working directory to root of apache webhost
WORKDIR var/www/html

#copy your files, if you want to copy all use COPY . .
COPY index.html /var/www/html

EXPOSE 80-90


#now start the server
CMD ["apachectl", "-D", "FOREGROUND"]
