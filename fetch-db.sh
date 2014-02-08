#!/bin/sh
# dumps all the tables of a specified database into separate .sql files
. ./config

database=$1

options="--user=$user --password=$pass --host=$host"
mkdir $database
for table in `./mysql-tables.pl $options --database=$database`;
do
    echo fetching $database/$table
    mysqldump $options --set-variable=max_allowed_packet=1G --single-transaction $database $table > $database/$table.sql;
done
