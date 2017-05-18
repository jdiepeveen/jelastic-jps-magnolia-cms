#!/bin/bash
ROOT_PASS=$1
NEW_USER=$2
NEW_PASS=$3

mysql -uroot -p${ROOT_PASS} << END
    CREATE DATABASE magnolia_author;
    CREATE USER '${NEW_USER}'@'%' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia_author.* TO '${NEW_USER}'@'%';
    FLUSH PRIVILEGES;
END

mysql -uroot -p${ROOT_PASS} << END
    CREATE DATABASE magnolia_public;
    CREATE USER '${NEW_USER}'@'%' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia_public.* TO '${NEW_USER}'@'%';
    FLUSH PRIVILEGES;
END