#!/bin/bash
USERNAME=$1
PASSWORD=$2

htpasswd -b -c /etc/nginx/conf.d/.htpasswd ${USERNAME} ${PASSWORD}