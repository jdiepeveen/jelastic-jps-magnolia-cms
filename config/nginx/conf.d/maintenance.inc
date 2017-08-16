# Maintenance page
error_page 503 @maintenance;

set $maintenance 0;
if (-f /var/nginx/tmp/maintenance/index.html) {
    set $maintenance 1;
}

if ($remote_addr = 87.249.125.15) {
    set $maintenance 0;
}

if ($maintenance = 1) {
    return 503;
}

location @maintenance {
    rewrite ^ /maintenance/ redirect;
}

location /maintenance/ {
    root /var/nginx/tmp;
    index index.html;
}