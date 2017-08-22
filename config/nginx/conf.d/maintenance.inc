geo $maintenance {
    default 0;
    87.249.125.15 1;
}

set $showMaintenance A;
# Check for the maintenance trigger
if (-f /usr/share/nginx/html/.maintenance) {
    set $maintenance 1;
}

if ($maintenance = 1) {
    return 503;
    break;
}

# Maintenance page
error_page 503 @maintenance;

location @maintenance {
    rewrite ^(.*)$ /503.html break;
}

location /maintenance/ {
    root /usr/share/nginx/html/maintenance;
    index index.html;
}