# ldapserver
FROM debian:latest
LABEL version="1.0"
LABEL author="@edt ASIX-M06 Curs 2022-2023"
LABEL subject="SAMBA Server"
RUN apt-get update
#ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install procps samba 
RUN apt-get -y install vim procps nmap tree iproute2
RUN apt-get -y install samba-client cifs-utils
RUN mkdir /opt/docker
COPY * /opt/docker/
RUN chmod +x /opt/docker/startup.sh
WORKDIR /opt/docker
CMD /opt/docker/startup.sh
