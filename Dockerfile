FROM ubuntu:latest
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get update
RUN apt-get install -y tomcat8
COPY /home/ubuntu/CubeGeneratorWeb.war /var/lib/tomcat8/webapps/
