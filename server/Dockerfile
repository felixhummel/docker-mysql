FROM ubuntu:12.04

RUN echo 'deb http://de.archive.ubuntu.com/ubuntu/ precise main' > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install --yes --no-install-recommends mysql-server

ADD my.cnf /etc/mysql/my.cnf

ADD grant_access.bash /tmp/grant_access.bash
RUN /bin/bash /tmp/grant_access.bash

EXPOSE 3306

ENTRYPOINT mysqld

