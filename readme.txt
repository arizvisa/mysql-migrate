Various scripts for splitting and migrating mysql data around.
From when I used to work at SI back in 2000. Found on an old backup.
Archived here for permanency.

config -- write your username, password, and host here.

create-user.sh
    automate creating a user
dump-db.sh
    use mysqldump to remotely dump an entire database
dupe-db.sh
    remotely and atomically duplicate a database into a different one.
fetch-db.sh
    remotely dump each table in a database to separate files.
import-tables.sh
    import all sql files into current database
import-users.pl
    i guess this imports a user table from stdin with the correct grants.
    input format is user:pass:database1,database2,database3
mysql-databases.pl
    dump all the databases on a server
mysql-tables.pl
    dump all the tables on a database

-arizvisa@gmail.com
