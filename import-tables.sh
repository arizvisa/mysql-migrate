#!/bin/sh
# takes a bunch of .sql and imports them into a specified database
. ./config

database=$1
shift

options="--user=$user --password=$pass --host=$host"

for f in $*; do
    echo importing $f into $database
    cat $f | grep -ve 'LOCK TABLES\|UNLOCK TABLES' | mysql $options $database
done
