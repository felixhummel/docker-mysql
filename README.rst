Docker Mysql
============
Simple Docker mysql server and mysql client.

Building
--------
The Client::

    docker build -t felix/mysqlclient client/

The Server::

    docker build -t felix/mysqlserver server/

Testing
-------
Start the server, and wait a second for it to start::

    docker run -d --name mysql_testserver felix/mysqlserver

Run the client (and remove it afterwards)::

    docker run --rm --name mysql_testclient -t -i --link mysql_testserver:x felix/mysqlclient bash -c 'mysql -uchangeme -pchangeme -h$X_PORT_3306_TCP_ADDR -e "select 23 as id from dual"'

Clean up::

    docker kill mysql_testserver && docker rm mysql_testserver

