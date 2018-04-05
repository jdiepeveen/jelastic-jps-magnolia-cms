#!/bin/bash
USER="root"
PASSWORD=$1
NEW_USER=$2
NEW_PASS=$3

# Create application-specific user
# And disable remote root login
mysql -u${USER} -p${PASSWORD} << END
    -- Create magnolia_public database
    CREATE DATABASE IF NOT EXISTS magnolia_public;

    -- Create 'root'@'127.0.0.1' which was removed by install script of Percona
    CREATE USER 'root'@'127.0.0.1' IDENTIFIED BY '${PASSWORD}';
    GRANT ALL ON *.* TO 'root'@'127.0.0.1' WITH GRANT OPTION;

    -- Grant access for ${NEW_USER} on the database
    GRANT ALL ON magnolia_public.* TO '${NEW_USER}'@'%';

    -- Remove remote access for root
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    FLUSH PRIVILEGES;
END