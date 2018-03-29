#!/bin/bash
USER="root"
PASSWORD=$1
NEW_USER=$2
NEW_PASS=$3

# Create application-specific user
# And disable remote root login
mysql -u${USER} -p${PASSWORD} << END
    CREATE DATABASE IF NOT EXISTS magnolia_public;

    CREATE USER '${NEW_USER}'@'%' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia_public.* TO '${NEW_USER}'@'%';

    DELETE FROM mysql.user WHERE user='root' AND host NOT IN ('localhost', '127.0.0.1', '::1');
    FLUSH PRIVILEGES;
END