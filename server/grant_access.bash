#!/bin/bash

username=changeme
password=changeme

# need to flush first (http://bugs.mysql.com/bug.php?id=38513)
# and then flush to make the changes take effect
mysqld --bootstrap<<EOF
flush privileges;
grant all on *.* to '$username'@'%' identified by '$password';
flush privileges;
EOF
exit 0

