# build
docker build -t mysql_server .
# run
docker run -d -name mysql_test -expose 3306 mysql_server mysqld
# test (give the server some time to start)
docker run -t -i -link mysql_test:x mysqlclient bash -c 'mysql -uchangeme -pchangeme -h$X_PORT_3306_TCP_ADDR -e "select 23 as id from dual"'
# cleanup
docker stop mysql_test && docker rm mysql_test

