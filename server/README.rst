# build
docker build -t mysqlserver .
# run
docker run -d -name mysql_testserver mysqlserver
# test (give the server some time to start)
docker run -name mysql_testclient -t -i -link mysql_testserver:x mysqlclient bash -c 'mysql -uchangeme -pchangeme -h$X_PORT_3306_TCP_ADDR -e "select 23 as id from dual"'
# cleanup
docker rm mysql_testclient && docker kill mysql_testserver && docker rm mysql_testserver

