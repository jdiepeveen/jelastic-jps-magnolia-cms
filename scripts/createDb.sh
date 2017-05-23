#!/bin/bash
ROOT_PASS=$1
NEW_USER=$2
NEW_PASS=$3

# Create application-specific user
# And disable remote root login
mysql -uroot -p${ROOT_PASS} << END
    CREATE DATABASE magnolia_author;
    CREATE DATABASE magnolia_public;
    CREATE USER '${NEW_USER}'@'localhost' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia_author.* TO '${NEW_USER}'@'localhost';
    GRANT ALL ON magnolia_public.* TO '${NEW_USER}'@'localhost';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    FLUSH PRIVILEGES;
END