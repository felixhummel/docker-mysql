Docker Mysql
============
Simple Docker mysql server and mysql client.

Building
--------
The Client::

    docker build -t mysqlclient client/

The Server::

    docker build -t mysqlserver .

Testing
-------
Start the server, and wait for it::

    docker run -d -name mysql_testserver mysqlserver

Run the client::

    docker run -name mysql_testclient -t -i -link mysql_testserver:x mysqlclient bash -c 'mysql -uchangeme -pchangeme -h$X_PORT_3306_TCP_ADDR -e "select 23 as id from dual"'

Clean up::

    docker rm mysql_testclient && docker kill mysql_testserver && docker rm mysql_testserver


