#curl -o /etc/nginx/update.sh https://gitee.com/saintvamp/nginx_conf/raw/master/update-404.sh
curl -o /etc/nginx/nginx.conf https://gitee.com/saintvamp/nginx_conf/raw/master/nginx-404.conf
/etc/init.d/nginx restart
