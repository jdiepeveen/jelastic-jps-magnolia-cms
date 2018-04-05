proxy_cache off;
location / {
    proxy_redirect     off;
    proxy_set_header   Host $host;
    proxy_set_header   X-Real-IP $remote_addr;
    proxy_set_header   X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header   X-Forwarded-Host $server_name;
    proxy_pass         http://app_server;
}

location = /favicon.ico {
    log_not_found off;
    access_log off;
}

location /.well-known/acme-challenge {
    alias /etc/letsencrypt/www/.well-known/acme-challenge;
    location ~ /.well-known/acme-challenge/(.*) {
        add_header Content-Type application/jose+json;
    }
}