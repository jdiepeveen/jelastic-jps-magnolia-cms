# parameters
set $app_scheme "https";
set $app_host "<application_url>";

# redirect to application hostname
if ($host != $app_host) {
    return 301 $app_scheme://$app_host$request_uri;
}

# redirect to production scheme (http or https)
if ($scheme != $app_scheme) {
        return 301 $app_scheme://$host$request_uri;
}