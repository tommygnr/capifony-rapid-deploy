# #######################################################
# ######## Note
# ######## TODO: Maintanance page @todo configure apache2 and Nginx
# cap deploy:web:enable
# cap deploy:web:disable REASON="upgrading to a better version" UNTIL="few minutes"
# Config add:
# Apache2 web/.htaccess
#ErrorDocument 503 /maintenance.html
#RewriteEngine On
#RewriteCond %{REQUEST_URI} !\.(css|gif|jpg|png)$
#RewriteCond %{DOCUMENT_ROOT}/maintenance.html -f
#RewriteCond %{SCRIPT_FILENAME} !maintenance.html
#RewriteRule ^.*$ - [redirect=503,last]
# Nginx config
# if (-f $document_root/maintenance.html) {
# return 503;
# }
# error_page 503 @maintenance;
# location @maintenance {
# rewrite ^(.*)$ /maintenance.html last;
# break;
# }
