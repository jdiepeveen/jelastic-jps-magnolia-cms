#!/bin/bash
ROOT_PASS=$1
NEW_USER=$2
NEW_PASS=$3
HOST=$4

# Create application-specific user
# And disable remote root login
mysql -uroot -p${ROOT_PASS} << END
    CREATE DATABASE IF NOT EXISTS magnolia-author CHARACTER SET utf8 COLLATE utf8_general_ci;
    CREATE DATABASE IF NOT EXISTS magnolia-public CHARACTER SET utf8 COLLATE utf8_general_ci;

    CREATE USER '${NEW_USER}'@'localhost' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia-author.* TO '${NEW_USER}'@'localhost';
    GRANT ALL ON magnolia-public.* TO '${NEW_USER}'@'localhost';

    CREATE USER '${NEW_USER}'@'127.0.0.1' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia-author.* TO '${NEW_USER}'@'127.0.0.1';
    GRANT ALL ON magnolia-public.* TO '${NEW_USER}'@'127.0.0.1';

    CREATE USER '${NEW_USER}'@'::1' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia-author.* TO '${NEW_USER}'@'::1';
    GRANT ALL ON magnolia-public.* TO '${NEW_USER}'@'::1';

    CREATE USER '${NEW_USER}'@'${HOST}' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON magnolia-author.* TO '${NEW_USER}'@'${HOST}';
    GRANT ALL ON magnolia-public.* TO '${NEW_USER}'@'${HOST}';

    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    FLUSH PRIVILEGES;
END