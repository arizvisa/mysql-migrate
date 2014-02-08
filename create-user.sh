#!/bin/sh
. ./config
options="--user=$user --password=$pass --host=$host"

echo "create user '$1' identified by '$2'" | mysql $options
