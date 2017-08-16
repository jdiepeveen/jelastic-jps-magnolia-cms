#!/bin/bash
ROOT_PASS=$1
NEW_USER=$2
NEW_PASS=$3

# Create application-specific user
# And disable remote root login
mysql -uroot -p${ROOT_PASS} << END
    CREATE DATABASE author;
    CREATE DATABASE public;
    CREATE USER '${NEW_USER}'@'localhost' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON author.* TO '${NEW_USER}'@'localhost';
    GRANT ALL ON public.* TO '${NEW_USER}'@'localhost';
    CREATE USER '${NEW_USER}'@'127.0.0.1' IDENTIFIED BY '${NEW_PASS}';
    GRANT ALL ON author.* TO '${NEW_USER}'@'127.0.0.1';
    GRANT ALL ON public.* TO '${NEW_USER}'@'127.0.0.1';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    FLUSH PRIVILEGES;
END