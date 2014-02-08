#!/bin/sh
. ./config
options="--user=$user --password=$pass --host=$host"
mysqldump $options --set-variable=max_allowed_packet=1G --single-transaction --databases $*

