FROM debian:jessie

RUN apt-get update && apt-get install --yes --no-install-recommends \
    mysql-server \
    && rm -rf /var/lib/apt/lists/*

ADD my.cnf /etc/mysql/my.cnf

ADD grant_access.bash /tmp/grant_access.bash
RUN /bin/bash /tmp/grant_access.bash

EXPOSE 3306

ENTRYPOINT mysqld

