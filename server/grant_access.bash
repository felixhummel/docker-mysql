#!/bin/bash

username=changeme
password=changeme

socket=/var/run/mysqld/mysqld.sock
startup_timeout_in_seconds=10
t0=$(date +%s)
echo "t0=$t0"
t1=$((t0 + startup_timeout_in_seconds))
echo "t1=$t1"

# daemon in background so we can use the client to allow remote access
mysqld_safe &

while true; do
  t=$(date +%s)
  echo "t=$t"
  if [[ -S $socket ]]; then
    echo "grant all on *.* to '$username'@'%' identified by '$password'; flush privileges;" | mysql
    break
  fi
  sleep 1
  [[ $t > $t1 ]] && break
done

exit 0

