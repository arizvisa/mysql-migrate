#!/bin/sh
# copies a database from one to another
. ./config

src=$1
dest=$2

options="--user=$user --password=$pass --host=$host"

mysqladmin $options create $2

mysqldump $options $src --single-transaction --set-variable=max_allowed_packet=1G | grep -ve '^LOCK TABLES\|UNLOCK TABLES' | mysql $options $dest
